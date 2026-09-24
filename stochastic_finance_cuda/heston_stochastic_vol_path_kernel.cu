#include "heston_stochastic_vol_path_kernel.cuh"

__global__ void heston_euler_step_kernel(float* S, float* V, const float* z1, const float* z2, float kappa, float theta, float xi, float dt, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float v = fmaxf(V[idx], 0.0f);
    V[idx] = v + kappa * (theta - v) * dt + xi * sqrtf(v * dt) * z2[idx];
    S[idx] *= expf(-0.5f * v * dt + sqrtf(v * dt) * z1[idx]);
}
