#include "interface.cuh"
#include <cmath>

namespace cu_warp_min_reduce_d59 {

__global__ void warp_min256_kernel(const float* d_in, float* d_out, int n) {
    __shared__ float wmin[8];
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    float v = (gid < n) ? d_in[gid] : 1e30f;
    for (int off = 16; off > 0; off >>= 1) {
        v = fminf(v, __shfl_down_sync(0xFFFFFFFFu, v, off));
    }
    int lane = threadIdx.x & 31;
    int wid = threadIdx.x >> 5;
    if (lane == 0) wmin[wid] = v;
    __syncthreads();
    if (wid == 0) {
        float m = (lane < 8) ? wmin[lane] : 1e30f;
        for (int off = 4; off > 0; off >>= 1) {
            m = fminf(m, __shfl_down_sync(0xFFFFFFFFu, m, off));
        }
        if (lane == 0) d_out[blockIdx.x] = m;
    }
}

} // namespace cu_warp_min_reduce_d59
