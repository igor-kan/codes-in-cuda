#include "quantum_norm_reduction_kernel.cuh"

__global__ void prob_density_kernel(const float2* psi, float* prob, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    prob[idx] = psi[idx].x * psi[idx].x + psi[idx].y * psi[idx].y;
}
