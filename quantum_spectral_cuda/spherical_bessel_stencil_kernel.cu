#include "spherical_bessel_stencil_kernel.cuh"

__global__ void bessel_j0_kernel(float* j0, const float* r, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float x = r[idx];
    j0[idx] = (fabsf(x) < 1e-6f) ? 1.0f : sinf(x) / x;
}
