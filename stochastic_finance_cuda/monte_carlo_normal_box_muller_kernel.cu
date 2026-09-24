#include "monte_carlo_normal_box_muller_kernel.cuh"

__global__ void box_muller_transform_kernel(const float* u1, const float* u2, float* z1, float* z2, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float r = sqrtf(-2.0f * logf(u1[idx]));
    float theta = 6.2831853f * u2[idx];
    z1[idx] = r * cosf(theta);
    z2[idx] = r * sinf(theta);
}
