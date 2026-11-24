#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_sobel_edge_2d_d59::validate_grid_dim(256) == cu_sobel_edge_2d_d59::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_sobel_edge_2d_d59::sobel_grad2d_kernel<<<dim3(1, 1), dim3(16, 16)>>>(d_a, d_b, 16, 16);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
