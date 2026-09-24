#include "heat_conduction_2d_stencil_kernel.cuh"

__global__ void heat_diffusion_2d_kernel(const float* u, float* u_next, int nx, int ny, float alpha_r) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x <= 0 || x >= nx - 1 || y <= 0 || y >= ny - 1) return;
    int idx = y * nx + x;
    float lap = u[idx + 1] + u[idx - 1] + u[idx + nx] + u[idx - nx] - 4.0f * u[idx];
    u_next[idx] = u[idx] + alpha_r * lap;
}
