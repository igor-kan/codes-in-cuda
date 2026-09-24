#include "kuramoto_sivashinsky_stencil_kernel.cuh"

__global__ void ks_nonlinear_step_kernel(const float* u, float* u_next, float dt_dx, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx <= 0 || idx >= n - 1) return;
    u_next[idx] = u[idx] - dt_dx * u[idx] * (u[idx + 1] - u[idx - 1]);
}
