#include "interface.cuh"
#include <cmath>

namespace cu_blelloch_scan_warp_d56 {

__global__ void blelloch_scan_kernel(const float* d_in, float* d_out, int n) {
    __shared__ float tile[256];
    int tid = threadIdx.x;
    int gid = blockIdx.x * blockDim.x + tid;
    tile[tid] = (gid < n) ? d_in[gid] : 0.0f;
    __syncthreads();
    for (int stride = 1; stride < 256; stride <<= 1) {
        int idx = (tid + 1) * stride * 2 - 1;
        if (idx < 256) tile[idx] += tile[idx - stride];
        __syncthreads();
    }
    if (tid == 0) tile[255] = 0.0f;
    __syncthreads();
    for (int stride = 128; stride >= 1; stride >>= 1) {
        int idx = (tid + 1) * stride * 2 - 1;
        if (idx < 256) {
            float tmp = tile[idx - stride];
            tile[idx - stride] = tile[idx];
            tile[idx] += tmp;
        }
        __syncthreads();
    }
    if (gid < n) d_out[gid] = tile[tid];
}

} // namespace cu_blelloch_scan_warp_d56
