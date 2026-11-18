#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_huber_loss_grad_fused_gpu::validate_grid_dim(256) == cu_huber_loss_grad_fused_gpu::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_huber_loss_grad_fused_gpu::launch_huber_grad(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
