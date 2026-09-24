#include "american_option_trinomial_step_kernel.cuh"

__global__ void trinomial_step_kernel(float* V, const float* payoff, float disc, float pu, float pm, float pd, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx <= 0 || idx >= n - 1) return;
    float cont = disc * (pu * V[idx + 1] + pm * V[idx] + pd * V[idx - 1]);
    V[idx] = fmaxf(cont, payoff[idx]);
}
