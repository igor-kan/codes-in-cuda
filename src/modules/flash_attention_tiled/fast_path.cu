#include "interface.cuh"
#include <cmath>

namespace cu_flash_attention_tiled {
__device__ __forceinline__ float warp_reduce_max(float v) {
    for (int offset = 16; offset > 0; offset >>= 1) {
        v = fmaxf(v, __shfl_xor_sync(0xffffffffu, v, offset));
    }
    return v;
}

__device__ __forceinline__ float warp_reduce_sum(float v) {
    for (int offset = 16; offset > 0; offset >>= 1) {
        v += __shfl_xor_sync(0xffffffffu, v, offset);
    }
    return v;
}

void launch_flash_attention_warp_fast(
    const float* d_q, const float* d_k, const float* d_v, float* d_o,
    FlashAttnConfig cfg, cudaStream_t stream) {
    launch_flash_attention_fwd(d_q, d_k, d_v, d_o, cfg, stream);
}
} // namespace cu_flash_attention_tiled
