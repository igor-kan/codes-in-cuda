#include "fourier_kinetic_phase_kernel.cuh"

__global__ void kinetic_phase_kernel(float2* psi_k, const float* k_sq, float dt_hbar_2m, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float angle = -k_sq[idx] * dt_hbar_2m;
    float c = cosf(angle), s = sinf(angle);
    float r = psi_k[idx].x, i = psi_k[idx].y;
    psi_k[idx].x = r * c - i * s;
    psi_k[idx].y = r * s + i * c;
}
