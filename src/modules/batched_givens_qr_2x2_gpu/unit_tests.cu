#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_batched_givens_qr_2x2_gpu::validate_grid_dim(256) == cu_batched_givens_qr_2x2_gpu::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_batched_givens_qr_2x2_gpu::launch_batched_givens(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
