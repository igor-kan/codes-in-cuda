#include "interface.cuh"
namespace cu_page_rank_power_csr_gpu {
__device__ __forceinline__ float pr_teleport(float d, int n, float dang) {
    return (1.0f - d + d * dang) / static_cast<float>(n);
}
} // namespace cu_page_rank_power_csr_gpu