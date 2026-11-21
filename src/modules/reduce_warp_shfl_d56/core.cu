#include "interface.cuh"
#include <cmath>

namespace cu_reduce_warp_shfl_d56 {

__global__ void warp_shfl_reduce_kernel(const float* d_in, float* d_out, int n) {
    __shared__ float warp_sums[8];
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    float v = (gid < n) ? d_in[gid] : 0.0f;
    for (int off = 16; off > 0; off >>= 1) {
        v += __shfl_down_sync(0xFFFFFFFFu, v, off);
    }
    int lane = threadIdx.x & 31;
    int wid = threadIdx.x >> 5;
    if (lane == 0) warp_sums[wid] = v;
    __syncthreads();
    if (wid == 0) {
        float final_v = (lane < 8) ? warp_sums[lane] : 0.0f;
        for (int off = 4; off > 0; off >>= 1) {
            final_v += __shfl_down_sync(0xFFFFFFFFu, final_v, off);
        }
        if (lane == 0) d_out[blockIdx.x] = final_v;
    }
}

} // namespace cu_reduce_warp_shfl_d56
