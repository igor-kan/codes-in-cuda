#include "interface.cuh"
#include <cmath>

namespace cu_conv1d_halo_smem_d56 {

__global__ void conv1d_halo_kernel(const float* d_in, float* d_out, int n) {
    __shared__ float smem[260];
    int tid = threadIdx.x;
    int gid = blockIdx.x * blockDim.x + tid;
    smem[tid + 2] = (gid < n) ? d_in[gid] : 0.0f;
    if (tid < 2) {
        int left_idx = gid - 2;
        smem[tid] = (left_idx >= 0) ? d_in[left_idx] : 0.0f;
        int right_idx = blockIdx.x * blockDim.x + blockDim.x + tid;
        smem[blockDim.x + 2 + tid] = (right_idx < n) ? d_in[right_idx] : 0.0f;
    }
    __syncthreads();
    if (gid < n) {
        float acc = 0.0f;
        for (int k = -2; k <= 2; ++k) acc += 0.2f * smem[tid + 2 + k];
        d_out[gid] = acc;
    }
}

} // namespace cu_conv1d_halo_smem_d56
