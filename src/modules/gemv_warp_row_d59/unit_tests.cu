#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_gemv_warp_row_d59::validate_grid_dim(256) == cu_gemv_warp_row_d59::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_gemv_warp_row_d59::warp_gemv_kernel<<<1, 256>>>(d_a, d_a, d_b, 8, 16);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
