#include "wave_equation_pml_sponge_kernel.cuh"

__global__ void pml_sponge_boundary_kernel(float* u, const float* sigma_pml, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    u[idx] *= expf(-sigma_pml[idx]);
}
