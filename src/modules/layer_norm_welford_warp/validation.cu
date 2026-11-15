#include "interface.cuh"

namespace cu_layer_norm_welford_warp {
int validate_layernorm_params(LayerNormParams params) {
    if (params.rows <= 0 || params.cols <= 0) return -1;
    if (params.eps <= 0.0f) return -2;
    return 0;
}
} // namespace cu_layer_norm_welford_warp
