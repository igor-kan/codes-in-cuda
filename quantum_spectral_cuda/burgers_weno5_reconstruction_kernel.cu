#include "burgers_weno5_reconstruction_kernel.cuh"

__global__ void weno5_flux_split_kernel(const float* u, float* f_plus, float* f_minus, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float f = 0.5f * u[idx] * u[idx];
    f_plus[idx] = 0.5f * (f + u[idx]);
    f_minus[idx] = 0.5f * (f - u[idx]);
}
