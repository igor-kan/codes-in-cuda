#include "poisson_red_black_gauss_seidel_kernel.cuh"

__global__ void poisson_red_black_kernel(float* u, const float* rhs, int nx, int ny, int color) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x <= 0 || x >= nx - 1 || y <= 0 || y >= ny - 1) return;
    if ((x + y) % 2 != color) return;
    int idx = y * nx + x;
    u[idx] = 0.25f * (u[idx + 1] + u[idx - 1] + u[idx + nx] + u[idx - nx] - rhs[idx]);
}
