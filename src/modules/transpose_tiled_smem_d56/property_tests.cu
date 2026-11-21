#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_transpose_tiled_smem_d56::validate_grid_dim(0) == cu_transpose_tiled_smem_d56::KernelStatus::InvalidDimension);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 512 * sizeof(float));
    cudaMalloc(&d_b, 512 * sizeof(float));
    cu_transpose_tiled_smem_d56::transpose_tile_kernel<<<dim3(1, 1), dim3(16, 16)>>>(d_a, d_b, 16);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
