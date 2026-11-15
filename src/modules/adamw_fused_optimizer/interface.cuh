#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_adamw_fused_optimizer {
void launch_adamw_fused(
    float* d_params, const float* d_grads, float* d_m, float* d_v,
    AdamWConfig cfg, cudaStream_t stream);
int validate_adamw_cfg(AdamWConfig cfg);
void launch_adamw_vec4_fast(
    float* d_params, const float* d_grads, float* d_m, float* d_v,
    AdamWConfig cfg, cudaStream_t stream);
void launch_adamw_multi_tensor(
    float** d_params, const float** d_grads, float** d_ms, float** d_vs,
    int num_tensors, const AdamWConfig* cfgs, cudaStream_t* streams);
int verify_second_moment_nonneg(const float* h_v, int n);
} // namespace cu_adamw_fused_optimizer
