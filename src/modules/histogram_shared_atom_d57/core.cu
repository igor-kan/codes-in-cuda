#include "interface.cuh"
#include <cmath>

namespace cu_histogram_shared_atom_d57 {

__global__ void hist_shared16_kernel(const float* d_in, float* d_out, int n) {
    __shared__ unsigned int bins[16];
    int tid = threadIdx.x;
    if (tid < 16) bins[tid] = 0u;
    __syncthreads();
    int gid = blockIdx.x * blockDim.x + tid;
    if (gid < n) {
        int b = static_cast<int>(d_in[gid]) & 15;
        atomicAdd(&bins[b], 1u);
    }
    __syncthreads();
    if (tid < 16) atomicAdd(&d_out[tid], static_cast<float>(bins[tid]));
}

} // namespace cu_histogram_shared_atom_d57
