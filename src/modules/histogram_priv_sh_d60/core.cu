#include "interface.cuh"
#include <cmath>

namespace cu_histogram_priv_sh_d60 {

__global__ void hist_priv32_kernel_d60(const float* x, float* bins_out, int n) {
    __shared__ unsigned int local_bins[32];
    int tx = threadIdx.x;
    if (tx < 32) local_bins[tx] = 0u;
    __syncthreads();
    int gid = blockIdx.x * blockDim.x + tx;
    if (gid < n) {
        int b = static_cast<int>(fminf(fmaxf(x[gid], 0.0f), 31.0f));
        atomicAdd(&local_bins[b], 1u);
    }
    __syncthreads();
    if (tx < 32) {
        atomicAdd(&bins_out[tx], static_cast<float>(local_bins[tx]));
    }
}

} // namespace cu_histogram_priv_sh_d60
