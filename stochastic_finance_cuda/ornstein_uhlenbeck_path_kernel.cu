#include "ornstein_uhlenbeck_path_kernel.cuh"

__global__ void ou_euler_step_kernel(float* X, const float* dW, float theta, float mu, float sigma, float dt, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    X[idx] += theta * (mu - X[idx]) * dt + sigma * sqrtf(dt) * dW[idx];
}
