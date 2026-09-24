#include "barrier_option_knockout_kernel.cuh"

__global__ void barrier_knockout_check_kernel(const float* S, int* active, float barrier, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    if (S[idx] >= barrier) active[idx] = 0;
}
