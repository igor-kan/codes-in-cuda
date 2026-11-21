#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_bitonic_warp_sort_d56::validate_grid_dim(0) == cu_bitonic_warp_sort_d56::KernelStatus::InvalidDimension);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 512 * sizeof(float));
    cudaMalloc(&d_b, 512 * sizeof(float));
    cu_bitonic_warp_sort_d56::bitonic_sort256_kernel<<<1, 256>>>(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
