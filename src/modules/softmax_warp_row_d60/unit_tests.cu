#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_softmax_warp_row_d60::validate_grid_dim(256) == cu_softmax_warp_row_d60::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_softmax_warp_row_d60::softmax_warp_kernel_d60<<<1, 256>>>(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
