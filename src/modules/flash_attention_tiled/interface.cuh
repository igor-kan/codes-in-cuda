#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_flash_attention_tiled {
void launch_flash_attention_fwd(
    const float* d_q, const float* d_k, const float* d_v, float* d_o,
    FlashAttnConfig cfg, cudaStream_t stream);
int validate_flash_cfg(FlashAttnConfig cfg);
void launch_flash_attention_warp_fast(
    const float* d_q, const float* d_k, const float* d_v, float* d_o,
    FlashAttnConfig cfg, cudaStream_t stream);
void launch_flash_attention_streams(
    const float** d_q_heads, const float** d_k_heads, const float** d_v_heads,
    float** d_o_heads, int num_heads, FlashAttnConfig cfg, cudaStream_t* streams);
FlashAttnStats verify_attention_against_cpu(
    const float* h_q, const float* h_k, const float* h_v, const float* h_o,
    FlashAttnConfig cfg);
} // namespace cu_flash_attention_tiled
