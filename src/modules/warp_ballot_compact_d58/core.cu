#include "interface.cuh"
#include <cmath>

namespace cu_warp_ballot_compact_d58 {

__global__ void warp_compact_kernel(const float* d_in, float* d_out, float thresh, int n) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned active = __activemask();
    float val = (gid < n) ? d_in[gid] : 0.0f;
    int keep = (gid < n && val > thresh) ? 1 : 0;
    unsigned ballot = __ballot_sync(active, keep);
    int lane = threadIdx.x & 31;
    int off = __popc(ballot & ((1u << lane) - 1u));
    if (keep) {
        int warp_base = (gid & ~31);
        d_out[warp_base + off] = val;
    }
}

} // namespace cu_warp_ballot_compact_d58
