#include "interface.cuh"

namespace cu_batched_givens_qr_2x2_gpu {

__device__ __forceinline__ float warp_sum_fp32(float val) {
    for (int offset = 16; offset > 0; offset >>= 1) {
        val += __shfl_down_sync(0xffffffffu, val, offset);
    }
    return val;
}

} // namespace cu_batched_givens_qr_2x2_gpu
