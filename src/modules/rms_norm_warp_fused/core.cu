#include "interface.cuh"
#include <cmath>

__device__ __forceinline__ float warp_sum(float val) {
    for (int offset = 16; offset > 0; offset >>= 1) {
        val += __shfl_xor_sync(0xFFFFFFFFu, val, offset);
    }
    return val;
}

__global__ void rms_norm_kernel(const float* __restrict__ x, const float* __restrict__ gamma, float* __restrict__ y, int dim, float eps) {
    __shared__ float smem[32];
    int row = blockIdx.x;
    int tid = threadIdx.x;
    const float* row_in = x + static_cast<size_t>(row) * dim;
    float* row_out = y + static_cast<size_t>(row) * dim;

    float sq_acc = 0.0f;
    for (int i = tid; i < dim; i += blockDim.x) {
        float v = row_in[i];
        sq_acc += v * v;
    }
    sq_acc = warp_sum(sq_acc);
    int warp_id = tid / 32;
    int lane = tid & 31;
    if (lane == 0) smem[warp_id] = sq_acc;
    __syncthreads();

    float block_sum = (tid < (blockDim.x + 31) / 32) ? smem[tid] : 0.0f;
    if (warp_id == 0) {
        block_sum = warp_sum(block_sum);
        if (tid == 0) smem[0] = rsqrtf(block_sum / static_cast<float>(dim) + eps);
    }
    __syncthreads();
    float inv_rms = smem[0];
    for (int i = tid; i < dim; i += blockDim.x) {
        row_out[i] = row_in[i] * inv_rms * gamma[i];
    }
}

KernelStatus launch_rms_norm_baseline(const float* d_x, const float* d_gamma, float* d_y, const RmsNormConfig& cfg, cudaStream_t stream) {
    KernelStatus st = validate_rms_cfg(cfg);
    if (st != KernelStatus::Ok) return st;
    rms_norm_kernel<<<cfg.rows, cfg.block_size, 0, stream>>>(d_x, d_gamma, d_y, cfg.hidden_dim, cfg.eps);
    return check_cuda(cudaGetLastError(), "rms_norm_kernel");
}
