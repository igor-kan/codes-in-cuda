#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_radix_histogram_256_gpu::validate_grid_dim(0) == cu_radix_histogram_256_gpu::KernelStatus::InvalidDimension);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 512 * sizeof(float));
    cudaMalloc(&d_b, 512 * sizeof(float));
    cu_radix_histogram_256_gpu::launch_radix_hist(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
