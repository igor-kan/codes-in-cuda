#include "interface.cuh"

namespace cu_layer_norm_welford_warp {
void launch_layernorm_multi_stream(
    const float** d_xs, const float* d_gamma, const float* d_beta, float** d_ys,
    int batches, LayerNormParams params, cudaStream_t* streams) {
    for (int i = 0; i < batches; ++i) {
        launch_welford_layernorm(d_xs[i], d_gamma, d_beta, d_ys[i], params, streams ? streams[i] : 0);
    }
}
} // namespace cu_layer_norm_welford_warp
