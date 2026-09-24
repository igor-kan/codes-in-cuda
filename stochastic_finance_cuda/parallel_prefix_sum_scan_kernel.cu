#include "parallel_prefix_sum_scan_kernel.cuh"

__global__ void block_prefix_sum_kernel(const float* in, float* out, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    out[idx] = in[idx];
}
