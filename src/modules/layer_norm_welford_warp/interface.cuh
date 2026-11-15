#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_layer_norm_welford_warp {
void launch_welford_layernorm(
    const float* d_x, const float* d_gamma, const float* d_beta, float* d_y,
    LayerNormParams params, cudaStream_t stream);
int validate_layernorm_params(LayerNormParams params);
void launch_welford_layernorm_vec4(
    const float* d_x, const float* d_gamma, const float* d_beta, float* d_y,
    LayerNormParams params, cudaStream_t stream);
void launch_layernorm_multi_stream(
    const float** d_xs, const float* d_gamma, const float* d_beta, float** d_ys,
    int batches, LayerNormParams params, cudaStream_t* streams);
float verify_layernorm_row_moments(const float* h_row, int cols, float eps);
} // namespace cu_layer_norm_welford_warp
