#include "helmholtz_jacobi_relaxation_kernel.cuh"

__global__ void helmholtz_jacobi_kernel(const float* u, float* u_next, const float* f, int nx, int ny, float k2_dx2) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x <= 0 || x >= nx - 1 || y <= 0 || y >= ny - 1) return;
    int idx = y * nx + x;
    u_next[idx] = (u[idx + 1] + u[idx - 1] + u[idx + nx] + u[idx - nx] - f[idx]) / (4.0f - k2_dx2);
}
