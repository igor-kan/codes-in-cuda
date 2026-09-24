#include "density_matrix_outer_product_kernel.cuh"

__global__ void outer_product_kernel(const float2* psi, float2* rho, int n) {
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n || j >= n) return;
    rho[i * n + j].x = psi[i].x * psi[j].x + psi[i].y * psi[j].y;
    rho[i * n + j].y = psi[i].y * psi[j].x - psi[i].x * psi[j].y;
}
