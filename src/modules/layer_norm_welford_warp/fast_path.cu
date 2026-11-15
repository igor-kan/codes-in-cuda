#include "interface.cuh"

namespace cu_layer_norm_welford_warp {
void launch_welford_layernorm_vec4(
    const float* d_x, const float* d_gamma, const float* d_beta, float* d_y,
    LayerNormParams params, cudaStream_t stream) {
    launch_welford_layernorm(d_x, d_gamma, d_beta, d_y, params, stream);
}
} // namespace cu_layer_norm_welford_warp
