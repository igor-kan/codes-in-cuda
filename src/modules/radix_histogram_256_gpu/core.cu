#include "interface.cuh"
#include <cmath>

namespace cu_radix_histogram_256_gpu {

__global__ void radix_hist_kernel(const float* __restrict__ in, float* __restrict__ bins, int n) {
    __shared__ float smem[256];
    int tid = threadIdx.x;
    smem[tid] = 0.0f;
    __syncthreads();
    int gid = blockIdx.x * blockDim.x + tid;
    if (gid < n) {
        int b = static_cast<int>(in[gid]) & 255;
        atomicAdd(&smem[b], 1.0f);
    }
    __syncthreads();
    atomicAdd(&bins[tid], smem[tid]);
}
void launch_radix_hist(const float* d_in, float* d_bins, int n) {
    radix_hist_kernel<<<(n + 255) / 256, 256>>>(d_in, d_bins, n);
}

} // namespace cu_radix_histogram_256_gpu
