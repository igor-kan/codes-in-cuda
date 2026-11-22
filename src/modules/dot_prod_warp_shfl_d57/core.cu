#include "interface.cuh"
#include <cmath>

namespace cu_dot_prod_warp_shfl_d57 {

__global__ void dot_warp_kernel(const float* d_a, float* d_b, int n) {
    __shared__ float wpartials[8];
    float acc = 0.0f;
    int stride = blockDim.x * gridDim.x;
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += stride) {
        float x = d_a[i];
        acc = fmaf(x, x, acc);
    }
    for (int off = 16; off > 0; off >>= 1) {
        acc += __shfl_down_sync(0xFFFFFFFFu, acc, off);
    }
    int lane = threadIdx.x & 31;
    int wid = threadIdx.x >> 5;
    if (lane == 0) wpartials[wid] = acc;
    __syncthreads();
    if (wid == 0) {
        float tot = (lane < 8) ? wpartials[lane] : 0.0f;
        for (int off = 4; off > 0; off >>= 1) {
            tot += __shfl_down_sync(0xFFFFFFFFu, tot, off);
        }
        if (lane == 0) d_b[blockIdx.x] = tot;
    }
}

} // namespace cu_dot_prod_warp_shfl_d57
