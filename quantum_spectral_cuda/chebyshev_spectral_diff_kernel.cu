#include "chebyshev_spectral_diff_kernel.cuh"

__global__ void chebyshev_elementwise_product(float* out, const float* D, const float* u, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n) return;
    float sum = 0.0f;
    for(int j=0; j<n; ++j) sum += D[i * n + j] * u[j];
    out[i] = sum;
}
