#include "interface.cuh"

namespace cu_adamw_fused_optimizer {
void launch_adamw_vec4_fast(
    float* d_params, const float* d_grads, float* d_m, float* d_v,
    AdamWConfig cfg, cudaStream_t stream) {
    launch_adamw_fused(d_params, d_grads, d_m, d_v, cfg, stream);
}
} // namespace cu_adamw_fused_optimizer
