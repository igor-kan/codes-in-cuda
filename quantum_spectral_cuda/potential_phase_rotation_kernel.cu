#include "potential_phase_rotation_kernel.cuh"

__global__ void phase_rotation_kernel(float2* state, float phase, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float c = cosf(phase), s = sinf(phase);
    float r = state[idx].x, i = state[idx].y;
    state[idx].x = r * c - i * s;
    state[idx].y = r * s + i * c;
}
