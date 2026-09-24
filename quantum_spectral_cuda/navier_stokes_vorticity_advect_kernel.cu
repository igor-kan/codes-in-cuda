#include "navier_stokes_vorticity_advect_kernel.cuh"

__global__ void vorticity_advect_kernel(const float* w, float* w_next, const float* u, const float* v, int nx, int ny, float dt_2dx) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x <= 0 || x >= nx - 1 || y <= 0 || y >= ny - 1) return;
    int idx = y * nx + x;
    float dw_dx = (w[idx + 1] - w[idx - 1]) * dt_2dx;
    float dw_dy = (w[idx + nx] - w[idx - nx]) * dt_2dx;
    w_next[idx] = w[idx] - (u[idx] * dw_dx + v[idx] * dw_dy);
}
