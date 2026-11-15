#include "interface.cuh"
#include <cfloat>
#include <cmath>

namespace cu_flash_attention_tiled {
constexpr int BR = 16;
constexpr int BC = 16;
constexpr int MAX_D = 64;

__global__ void flash_attn_fwd_kernel(
    const float* __restrict__ Q,
    const float* __restrict__ K,
    const float* __restrict__ V,
    float* __restrict__ O,
    int N, int d, float scale, int causal) {
    __shared__ float sK[BC][MAX_D];
    __shared__ float sV[BC][MAX_D];
    __shared__ float sS[BR][BC];

    int row_blk = blockIdx.x * BR;
    int ty = threadIdx.y;
    int tx = threadIdx.x;
    int row = row_blk + ty;

    float q_reg[4] = {0.0f, 0.0f, 0.0f, 0.0f};
    float acc[4] = {0.0f, 0.0f, 0.0f, 0.0f};
    if (row < N) {
        for (int p = 0; p < 4; ++p) {
            int col = tx * 4 + p;
            if (col < d) q_reg[p] = Q[row * d + col];
        }
    }
    float m_i = -FLT_MAX;
    float l_i = 0.0f;

    int num_tiles = (N + BC - 1) / BC;
    for (int t = 0; t < num_tiles; ++t) {
        int kv_row = t * BC + ty;
        if (kv_row < N) {
            for (int p = 0; p < 4; ++p) {
                int col = tx * 4 + p;
                sK[ty][col] = (col < d) ? K[kv_row * d + col] : 0.0f;
                sV[ty][col] = (col < d) ? V[kv_row * d + col] : 0.0f;
            }
        } else {
            for (int p = 0; p < 4; ++p) {
                sK[ty][tx * 4 + p] = 0.0f;
                sV[ty][tx * 4 + p] = 0.0f;
            }
        }
        __syncthreads();

        int k_col_idx = t * BC + tx;
        float score = -FLT_MAX;
        if (row < N && k_col_idx < N && (!causal || k_col_idx <= row)) {
            float dot = 0.0f;
            for (int col = 0; col < d; ++col) {
                float qv = Q[row * d + col];
                dot += qv * sK[tx][col];
            }
            score = dot * scale;
        }
        sS[ty][tx] = score;
        __syncthreads();

        if (row < N) {
            float m_tile = -FLT_MAX;
            for (int c = 0; c < BC; ++c) m_tile = fmaxf(m_tile, sS[ty][c]);
            float m_new = fmaxf(m_i, m_tile);
            float alpha = (m_i == -FLT_MAX) ? 0.0f : expf(m_i - m_new);
            float l_tile = 0.0f;
            for (int c = 0; c < BC; ++c) {
                float w = (sS[ty][c] > -FLT_MAX * 0.5f) ? expf(sS[ty][c] - m_new) : 0.0f;
                l_tile += w;
                for (int p = 0; p < 4; ++p) {
                    int col = tx * 4 + p;
                    if (c == 0) acc[p] *= alpha;
                    if (col < d) acc[p] += w * sV[c][col];
                }
            }
            l_i = l_i * alpha + l_tile;
            m_i = m_new;
        }
        __syncthreads();
    }

    if (row < N && l_i > 0.0f) {
        float inv_l = 1.0f / l_i;
        for (int p = 0; p < 4; ++p) {
            int col = tx * 4 + p;
            if (col < d) O[row * d + col] = acc[p] * inv_l;
        }
    }
}

void launch_flash_attention_fwd(
    const float* d_q, const float* d_k, const float* d_v, float* d_o,
    FlashAttnConfig cfg, cudaStream_t stream) {
    dim3 block(BC, BR);
    dim3 grid((cfg.seq_len + BR - 1) / BR);
    flash_attn_fwd_kernel<<<grid, block, 0, stream>>>(
        d_q, d_k, d_v, d_o, cfg.seq_len, cfg.head_dim, cfg.scale, cfg.causal_mask);
}
} // namespace cu_flash_attention_tiled
