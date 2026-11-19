#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_dense_gemv_shared_x_gpu::validate_grid_dim(256) == cu_dense_gemv_shared_x_gpu::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_dense_gemv_shared_x_gpu::launch_shared_gemv(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
