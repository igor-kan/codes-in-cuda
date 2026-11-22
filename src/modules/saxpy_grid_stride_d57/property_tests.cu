#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_saxpy_grid_stride_d57::validate_grid_dim(0) == cu_saxpy_grid_stride_d57::KernelStatus::InvalidDimension);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 512 * sizeof(float));
    cudaMalloc(&d_b, 512 * sizeof(float));
    cu_saxpy_grid_stride_d57::saxpy_stride_kernel<<<1, 256>>>(d_a, d_b, 2.5f, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
