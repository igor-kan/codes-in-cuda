#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_reduce_argmax_warp_cuda::validate_grid_dim(0) == cu_reduce_argmax_warp_cuda::KernelStatus::InvalidDimension);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 512 * sizeof(float));
    cudaMalloc(&d_b, 512 * sizeof(float));
    cu_reduce_argmax_warp_cuda::launch_argmax_warp(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
