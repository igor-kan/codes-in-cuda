#include "pauli_spin_rotation_kernel.cuh"

__global__ void pauli_z_rotation_kernel(float2* spinor_up, float2* spinor_dn, float theta, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float c = cosf(0.5f * theta), s = sinf(0.5f * theta);
    spinor_up[idx].x *= c;
    spinor_dn[idx].x *= -s;
}
