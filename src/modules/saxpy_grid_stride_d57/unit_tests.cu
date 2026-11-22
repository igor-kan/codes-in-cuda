#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_saxpy_grid_stride_d57::validate_grid_dim(256) == cu_saxpy_grid_stride_d57::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_saxpy_grid_stride_d57::saxpy_stride_kernel<<<1, 256>>>(d_a, d_b, 2.5f, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
