#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_warp_min_reduce_d59::validate_grid_dim(256) == cu_warp_min_reduce_d59::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_warp_min_reduce_d59::warp_min256_kernel<<<1, 256>>>(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
