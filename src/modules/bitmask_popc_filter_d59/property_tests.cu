#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_bitmask_popc_filter_d59::validate_grid_dim(0) == cu_bitmask_popc_filter_d59::KernelStatus::InvalidDimension);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 512 * sizeof(float));
    cudaMalloc(&d_b, 512 * sizeof(float));
    cu_bitmask_popc_filter_d59::warp_popc_count_kernel<<<1, 256>>>(d_a, d_b, 0.5f, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
