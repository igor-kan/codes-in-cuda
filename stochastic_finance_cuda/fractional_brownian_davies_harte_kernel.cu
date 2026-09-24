#include "fractional_brownian_davies_harte_kernel.cuh"

__global__ void fbm_spectral_scale_kernel(float2* w, const float* eig, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float s = sqrtf(fmaxf(eig[idx], 0.0f));
    w[idx].x *= s;
    w[idx].y *= s;
}
