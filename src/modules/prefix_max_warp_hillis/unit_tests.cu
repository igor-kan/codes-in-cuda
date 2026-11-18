#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_prefix_max_warp_hillis::validate_grid_dim(256) == cu_prefix_max_warp_hillis::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_prefix_max_warp_hillis::launch_prefix_max(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
