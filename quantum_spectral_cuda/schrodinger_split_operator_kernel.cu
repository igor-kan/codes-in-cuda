#include "schrodinger_split_operator_kernel.cuh"

__global__ void schrodinger_potential_phase_kernel(float2* psi, const float* V, float dt_hbar, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float angle = -V[idx] * dt_hbar;
    float c = cosf(angle), s = sinf(angle);
    float r = psi[idx].x, i = psi[idx].y;
    psi[idx].x = r * c - i * s;
    psi[idx].y = r * s + i * c;
}
