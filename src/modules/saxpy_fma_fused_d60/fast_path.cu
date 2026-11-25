#include "interface.cuh"

namespace cu_saxpy_fma_fused_d60 {

__device__ __forceinline__ float warp_sum_fp32(float val) {
    for (int offset = 16; offset > 0; offset >>= 1) {
        val += __shfl_down_sync(0xffffffffu, val, offset);
    }
    return val;
}

} // namespace cu_saxpy_fma_fused_d60
