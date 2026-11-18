#include "interface.cuh"
#include <cmath>

namespace cu_huber_loss_grad_fused_gpu {

__global__ void huber_kernel(const float* __restrict__ err, float* __restrict__ grad, int n, float delta) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n) return;
    float r = err[i];
    float a = fabsf(r);
    grad[i] = (a <= delta) ? r : (r > 0.0f ? delta : -delta);
}
void launch_huber_grad(const float* d_err, float* d_grad, int n) {
    huber_kernel<<<(n + 255) / 256, 256>>>(d_err, d_grad, n, 1.0f);
}

} // namespace cu_huber_loss_grad_fused_gpu
