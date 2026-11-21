#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_conv1d_halo_smem_d56::validate_grid_dim(256) == cu_conv1d_halo_smem_d56::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_conv1d_halo_smem_d56::conv1d_halo_kernel<<<1, 256>>>(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
