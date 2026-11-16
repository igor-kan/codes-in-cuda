#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_rms_norm_warp_fused {
KernelStatus launch_rms_norm_baseline(const float* d_x, const float* d_gamma, float* d_y, const RmsNormConfig& cfg, cudaStream_t stream);
KernelStatus validate_rms_cfg(const RmsNormConfig& cfg);
KernelStatus launch_rms_norm_vec4(const float* d_x, const float* d_gamma, float* d_y, const RmsNormConfig& cfg, cudaStream_t stream);
KernelStatus launch_rms_norm_multistream(const float* const* xs, const float* d_gamma, float* const* ys, int n_chunks, const RmsNormConfig& cfg, cudaStream_t* streams);
KernelStatus verify_rms_cpu_parity(const float* h_x, const float* h_gamma, const float* h_y, const RmsNormConfig& cfg, float tol);
} // namespace cu_rms_norm_warp_fused
