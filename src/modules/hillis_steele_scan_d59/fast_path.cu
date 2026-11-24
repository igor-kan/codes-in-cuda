#include "interface.cuh"

namespace cu_hillis_steele_scan_d59 {

__device__ __forceinline__ float warp_sum_fp32(float val) {
    for (int offset = 16; offset > 0; offset >>= 1) {
        val += __shfl_down_sync(0xffffffffu, val, offset);
    }
    return val;
}

} // namespace cu_hillis_steele_scan_d59
