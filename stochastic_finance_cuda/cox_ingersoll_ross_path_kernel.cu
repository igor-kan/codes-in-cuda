#include "cox_ingersoll_ross_path_kernel.cuh"

__global__ void cir_step_kernel(float* R, const float* dW, float k, float theta, float sigma, float dt, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float r_pos = fmaxf(R[idx], 0.0f);
    R[idx] = r_pos + k * (theta - r_pos) * dt + sigma * sqrtf(r_pos * dt) * dW[idx];
}
