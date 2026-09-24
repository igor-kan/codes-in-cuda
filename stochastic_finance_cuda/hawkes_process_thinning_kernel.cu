#include "hawkes_process_thinning_kernel.cuh"

__global__ void hawkes_intensity_kernel(float* lambda_t, const float* decay_sum, float mu, float alpha, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    lambda_t[idx] = mu + alpha * decay_sum[idx];
}
