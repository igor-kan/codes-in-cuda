#include "copula_gaussian_bivariate_kernel.cuh"

__global__ void correlated_normals_kernel(const float* z1, const float* z2, float* x2, float rho, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    x2[idx] = rho * z1[idx] + sqrtf(1.0f - rho * rho) * z2[idx];
}
