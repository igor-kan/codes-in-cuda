#include "lookback_option_extremum_kernel.cuh"

__global__ void lookback_running_max_kernel(const float* S, float* S_max, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    S_max[idx] = fmaxf(S_max[idx], S[idx]);
}
