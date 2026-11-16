#include "interface.cuh"

__global__ void trsv32_warp_kernel(const float* __restrict__ U, const float* __restrict__ rhs, float* __restrict__ x_out, int batch_count) {
    int warp_global = (blockIdx.x * blockDim.x + threadIdx.x) >> 5;
    if (warp_global >= batch_count) return;
    int lane = threadIdx.x & 31;
    const float* u_mat = U + static_cast<size_t>(warp_global) * 1024;
    float b_val = rhs[static_cast<size_t>(warp_global) * 32 + lane];
    float sum = 0.0f;

    for (int k = 31; k >= 0; --k) {
        float xk = 0.0f;
        if (lane == k) {
            xk = (b_val - sum) / u_mat[k * 32 + k];
        }
        xk = __shfl_sync(0xFFFFFFFFu, xk, k);
        if (lane < k) {
            sum += u_mat[lane * 32 + k] * xk;
        }
        if (lane == k) {
            x_out[static_cast<size_t>(warp_global) * 32 + lane] = xk;
        }
    }
}

KernelStatus launch_trsv32_warp(const float* d_upper, const float* d_rhs, float* d_x, const Trsv32Config& cfg, cudaStream_t stream) {
    KernelStatus st = validate_trsv32(cfg);
    if (st != KernelStatus::Ok) return st;
    int warps_per_blk = 4;
    int blocks = (cfg.batch_count + warps_per_blk - 1) / warps_per_blk;
    trsv32_warp_kernel<<<blocks, warps_per_blk * 32, 0, stream>>>(d_upper, d_rhs, d_x, cfg.batch_count);
    return check_cuda(cudaGetLastError(), "trsv32_warp_kernel");
}
