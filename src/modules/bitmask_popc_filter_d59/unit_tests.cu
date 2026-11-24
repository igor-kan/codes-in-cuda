#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_bitmask_popc_filter_d59::validate_grid_dim(256) == cu_bitmask_popc_filter_d59::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_bitmask_popc_filter_d59::warp_popc_count_kernel<<<1, 256>>>(d_a, d_b, 0.5f, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
