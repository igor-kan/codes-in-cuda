#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_dot_prod_warp_shfl_d57::validate_grid_dim(256) == cu_dot_prod_warp_shfl_d57::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_dot_prod_warp_shfl_d57::dot_warp_kernel<<<1, 256>>>(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
