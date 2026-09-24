#include "lax_wendroff_2d_flux_kernel.cuh"

__global__ void lax_wendroff_1d_step_kernel(const float* u, float* u_next, float cfl, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx <= 0 || idx >= n - 1) return;
    u_next[idx] = u[idx] - 0.5f * cfl * (u[idx + 1] - u[idx - 1]) + 0.5f * cfl * cfl * (u[idx + 1] - 2.0f * u[idx] + u[idx - 1]);
}
