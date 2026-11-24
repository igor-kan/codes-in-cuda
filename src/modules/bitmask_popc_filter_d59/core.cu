#include "interface.cuh"
#include <cmath>

namespace cu_bitmask_popc_filter_d59 {

__global__ void warp_popc_count_kernel(const float* d_in, float* d_out, float limit, int n) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned active = __activemask();
    int hit = (gid < n && d_in[gid] > limit) ? 1 : 0;
    unsigned bits = __ballot_sync(active, hit);
    int lane = threadIdx.x & 31;
    int wid = gid >> 5;
    if (lane == 0 && (wid * 32) < n) {
        d_out[wid] = static_cast<float>(__popc(bits));
    }
}

} // namespace cu_bitmask_popc_filter_d59
