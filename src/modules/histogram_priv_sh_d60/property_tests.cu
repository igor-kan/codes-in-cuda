#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_histogram_priv_sh_d60::validate_grid_dim(0) == cu_histogram_priv_sh_d60::KernelStatus::InvalidDimension);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 512 * sizeof(float));
    cudaMalloc(&d_b, 512 * sizeof(float));
    cu_histogram_priv_sh_d60::hist_priv32_kernel_d60<<<1, 256>>>(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
