#include "merton_jump_diffusion_path_kernel.cuh"

__global__ void merton_jump_step_kernel(float* S, const float* dW, const float* jump, float drift_dt, float vol_sq_dt, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    S[idx] *= expf(drift_dt + vol_sq_dt * dW[idx] + jump[idx]);
}
