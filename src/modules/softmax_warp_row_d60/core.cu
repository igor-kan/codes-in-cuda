#include "interface.cuh"
#include <cmath>

namespace cu_softmax_warp_row_d60 {

__global__ void softmax_warp_kernel_d60(const float* x, float* out, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid >= n) return;
    float v = x[tid];
    float vmax = v;
    for (int off = 16; off > 0; off >>= 1) {
        float peer = __shfl_xor_sync(0xffffffffu, vmax, off);
        vmax = peer > vmax ? peer : vmax;
    }
    float ev = expf(v - vmax);
    float sum = ev;
    for (int off = 16; off > 0; off >>= 1) {
        sum += __shfl_xor_sync(0xffffffffu, sum, off);
    }
    out[tid] = ev / sum;
}

} // namespace cu_softmax_warp_row_d60
