#include "interface.cuh"
#include <cmath>

namespace cu_hillis_steele_scan_d59 {

__global__ void hillis_steele256_kernel(const float* d_in, float* d_out, int n) {
    __shared__ float buf[2][256];
    int tid = threadIdx.x;
    int pout = 0, pin = 1;
    buf[0][tid] = (tid < n) ? d_in[tid] : 0.0f;
    __syncthreads();
    for (int off = 1; off < 256; off <<= 1) {
        pout = 1 - pout;
        pin = 1 - pout;
        float val = buf[pin][tid];
        if (tid >= off) val += buf[pin][tid - off];
        buf[pout][tid] = val;
        __syncthreads();
    }
    if (tid < n) d_out[tid] = buf[pout][tid];
}

} // namespace cu_hillis_steele_scan_d59
