#include "interface.cuh"
namespace cu_top_k_warp_bitonic_select {
__device__ __forceinline__ void warp_cmp_swap(float& v, int& idx, int mask, bool dir) {
    float pv = __shfl_xor_sync(0xffffffffu, v, mask);
    int pi = __shfl_xor_sync(0xffffffffu, idx, mask);
    if ((v < pv) == dir) { v = pv; idx = pi; }
}
} // namespace cu_top_k_warp_bitonic_select