#include "interface.cuh"
#include <cmath>

__global__ void bilateral_global_kernel(const float* __restrict__ src, float* __restrict__ dst, BilateralConfig cfg) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x >= cfg.width || y >= cfg.height) return;
    float center = src[y * cfg.width + x];
    float w_sum = 0.0f, acc = 0.0f;
    for (int dy = -cfg.radius; dy <= cfg.radius; ++dy) {
        int yy = min(max(y + dy, 0), cfg.height - 1);
        for (int dx = -cfg.radius; dx <= cfg.radius; ++dx) {
            int xx = min(max(x + dx, 0), cfg.width - 1);
            float val = src[yy * cfg.width + xx];
            float ds2 = static_cast<float>(dx * dx + dy * dy);
            float dr = val - center;
            float w = __expf(-ds2 * cfg.inv_two_sigma_s2 - dr * dr * cfg.inv_two_sigma_r2);
            w_sum += w;
            acc += w * val;
        }
    }
    dst[y * cfg.width + x] = acc / w_sum;
}

KernelStatus launch_bilateral_global(const float* d_in, float* d_out, const BilateralConfig& cfg, cudaStream_t stream) {
    KernelStatus st = validate_bilateral(cfg);
    if (st != KernelStatus::Ok) return st;
    dim3 block(16, 16);
    dim3 grid((cfg.width + 15) / 16, (cfg.height + 15) / 16);
    bilateral_global_kernel<<<grid, block, 0, stream>>>(d_in, d_out, cfg);
    return check_cuda(cudaGetLastError(), "bilateral_global_kernel");
}
