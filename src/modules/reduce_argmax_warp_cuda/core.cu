#include "interface.cuh"
#include <cmath>

namespace cu_reduce_argmax_warp_cuda {

__global__ void argmax_warp_kernel(const float* __restrict__ in, float* __restrict__ out, int n) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    float best_v = gid < n ? in[gid] : -1e30f;
    int best_i = gid < n ? gid : -1;
    for (int off = 16; off > 0; off >>= 1) {
        float ov = __shfl_down_sync(0xffffffffu, best_v, off);
        int oi = __shfl_down_sync(0xffffffffu, best_i, off);
        if (ov > best_v || (ov == best_v && oi >= 0 && oi < best_i)) {
            best_v = ov; best_i = oi;
        }
    }
    if ((threadIdx.x & 31) == 0 && gid < n) out[gid >> 5] = static_cast<float>(best_i);
}
void launch_argmax_warp(const float* d_in, float* d_out, int n) {
    argmax_warp_kernel<<<(n + 255) / 256, 256>>>(d_in, d_out, n);
}

} // namespace cu_reduce_argmax_warp_cuda
