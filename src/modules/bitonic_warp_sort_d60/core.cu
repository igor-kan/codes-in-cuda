#include "interface.cuh"
#include <cmath>

namespace cu_bitonic_warp_sort_d60 {

__global__ void bitonic_sort_256_d60(const float* in, float* out, int n) {
    __shared__ float tile[256];
    int tx = threadIdx.x;
    int gid = blockIdx.x * 256 + tx;
    tile[tx] = (gid < n) ? in[gid] : 1e30f;
    __syncthreads();
    for (int k = 2; k <= 256; k <<= 1) {
        for (int j = k >> 1; j > 0; j >>= 1) {
            int ixj = tx ^ j;
            if (ixj > tx) {
                bool asc = ((tx & k) == 0);
                float a = tile[tx], b = tile[ixj];
                if ((asc && a > b) || (!asc && a < b)) {
                    tile[tx] = b;
                    tile[ixj] = a;
                }
            }
            __syncthreads();
        }
    }
    if (gid < n) out[gid] = tile[tx];
}

} // namespace cu_bitonic_warp_sort_d60
