#include "garch_conditional_variance_kernel.cuh"

__global__ void garch_update_kernel(float* sigma2, const float* eps, float omega, float alpha, float beta, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    sigma2[idx] = omega + alpha * eps[idx] * eps[idx] + beta * sigma2[idx];
}
