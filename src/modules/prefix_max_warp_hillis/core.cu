#include "interface.cuh"
#include <cmath>

namespace cu_prefix_max_warp_hillis {

__global__ void prefix_max_kernel(const float* __restrict__ in, float* __restrict__ out, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int lane = threadIdx.x & 31;
    float v = i < n ? in[i] : -1e30f;
    for (int d = 1; d < 32; d <<= 1) {
        float nbh = __shfl_up_sync(0xffffffffu, v, d);
        if (lane >= d && nbh > v) v = nbh;
    }
    if (i < n) out[i] = v;
}
void launch_prefix_max(const float* d_in, float* d_out, int n) {
    prefix_max_kernel<<<(n + 255) / 256, 256>>>(d_in, d_out, n);
}

} // namespace cu_prefix_max_warp_hillis
