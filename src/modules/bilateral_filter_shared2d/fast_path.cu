#include "interface.cuh"

__global__ void bilateral_shared_16x16_kernel(const float* __restrict__ src, float* __restrict__ dst, BilateralConfig cfg) {
    constexpr int TW = 16;
    constexpr int MAX_R = 4;
    __shared__ float tile[TW + 2 * MAX_R][TW + 2 * MAX_R];
    int tx = threadIdx.x, ty = threadIdx.y;
    int bx = blockIdx.x * TW, by = blockIdx.y * TW;
    int halo = cfg.radius;
    int tile_span = TW + 2 * halo;

    for (int ly = ty; ly < tile_span; ly += TW) {
        int gy = min(max(by + ly - halo, 0), cfg.height - 1);
        for (int lx = tx; lx < tile_span; lx += TW) {
            int gx = min(max(bx + lx - halo, 0), cfg.width - 1);
            tile[ly][lx] = src[gy * cfg.width + gx];
        }
    }
    __syncthreads();

    int x = bx + tx, y = by + ty;
    if (x >= cfg.width || y >= cfg.height) return;
    float center = tile[ty + halo][tx + halo];
    float w_sum = 0.0f, acc = 0.0f;
    for (int dy = -halo; dy <= halo; ++dy) {
        for (int dx = -halo; dx <= halo; ++dx) {
            float v = tile[ty + halo + dy][tx + halo + dx];
            float dr = v - center;
            float w = __expf(-static_cast<float>(dx * dx + dy * dy) * cfg.inv_two_sigma_s2 - dr * dr * cfg.inv_two_sigma_r2);
            w_sum += w;
            acc += w * v;
        }
    }
    dst[y * cfg.width + x] = acc / w_sum;
}

KernelStatus launch_bilateral_shared(const float* d_in, float* d_out, const BilateralConfig& cfg, cudaStream_t stream) {
    KernelStatus st = validate_bilateral(cfg);
    if (st != KernelStatus::Ok) return st;
    dim3 block(16, 16);
    dim3 grid((cfg.width + 15) / 16, (cfg.height + 15) / 16);
    bilateral_shared_16x16_kernel<<<grid, block, 0, stream>>>(d_in, d_out, cfg);
    return check_cuda(cudaGetLastError(), "bilateral_shared_16x16_kernel");
}
