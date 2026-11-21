#include "interface.cuh"
#include <cmath>

namespace cu_bitonic_warp_sort_d56 {

__global__ void bitonic_sort256_kernel(const float* d_in, float* d_out, int n) {
    __shared__ float sdata[256];
    int tid = threadIdx.x;
    sdata[tid] = (tid < n) ? d_in[tid] : 1e30f;
    __syncthreads();
    for (int k = 2; k <= 256; k <<= 1) {
        for (int j = k >> 1; j > 0; j >>= 1) {
            int ixj = tid ^ j;
            if (ixj > tid) {
                bool up = ((tid & k) == 0);
                float a = sdata[tid];
                float b = sdata[ixj];
                if ((up && a > b) || (!up && a < b)) {
                    sdata[tid] = b;
                    sdata[ixj] = a;
                }
            }
            __syncthreads();
        }
    }
    if (tid < n) d_out[tid] = sdata[tid];
}

} // namespace cu_bitonic_warp_sort_d56
