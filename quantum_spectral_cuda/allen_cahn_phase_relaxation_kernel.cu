#include "allen_cahn_phase_relaxation_kernel.cuh"

__global__ void allen_cahn_reaction_kernel(float* u, float dt, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float val = u[idx];
    u[idx] = val - dt * (val * val * val - val);
}
