#include "interface.cuh"
#include <cmath>

namespace cu_rope_rotary_embedding {
__global__ void rope_forward_kernel(float* __restrict__ data, RopeConfig cfg) {
    int half_d = cfg.head_dim >> 1;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int total = cfg.seq_len * cfg.num_heads * half_d;
    if (idx >= total) return;

    int pair_k = idx % half_d;
    int rem = idx / half_d;
    int seq_pos = (rem / cfg.num_heads) + cfg.pos_offset;

    float freq = powf(cfg.base_theta, -2.0f * static_cast<float>(pair_k) / static_cast<float>(cfg.head_dim));
    float angle = static_cast<float>(seq_pos) * freq;
    float s_val = 0.0f, c_val = 0.0f;
    __sincosf(angle, &s_val, &c_val);

    int base = idx * 2;
    float x0 = data[base];
    float x1 = data[base + 1];
    data[base]     = x0 * c_val - x1 * s_val;
    data[base + 1] = x0 * s_val + x1 * c_val;
}

void launch_rope_forward(float* d_qk, RopeConfig cfg, cudaStream_t stream) {
    int half_d = cfg.head_dim >> 1;
    int total = cfg.seq_len * cfg.num_heads * half_d;
    int threads = 256;
    int blocks = (total + threads - 1) / threads;
    rope_forward_kernel<<<blocks, threads, 0, stream>>>(d_qk, cfg);
}
} // namespace cu_rope_rotary_embedding
