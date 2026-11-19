#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_stencil_5pt_halo_tiled::validate_grid_dim(256) == cu_stencil_5pt_halo_tiled::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_stencil_5pt_halo_tiled::launch_5pt_stencil(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
