#include "bloch_electron_dispersion_kernel.cuh"

__global__ void bloch_dispersion_kernel(float* E, const float* k, float a, float t_hop, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    E[idx] = -2.0f * t_hop * cosf(k[idx] * a);
}
