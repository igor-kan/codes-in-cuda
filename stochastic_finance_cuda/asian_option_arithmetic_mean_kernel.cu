#include "asian_option_arithmetic_mean_kernel.cuh"

__global__ void asian_running_sum_kernel(const float* S, float* S_sum, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    S_sum[idx] += S[idx];
}
