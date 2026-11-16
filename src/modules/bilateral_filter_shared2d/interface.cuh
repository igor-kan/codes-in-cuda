#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_bilateral_filter_shared2d {
KernelStatus launch_bilateral_global(const float* d_in, float* d_out, const BilateralConfig& cfg, cudaStream_t stream);
KernelStatus validate_bilateral(const BilateralConfig& cfg);
KernelStatus launch_bilateral_shared(const float* d_in, float* d_out, const BilateralConfig& cfg, cudaStream_t stream);
KernelStatus launch_bilateral_batch(const float* const* ins, float* const* outs, int n_frames, const BilateralConfig& cfg, cudaStream_t* streams);
KernelStatus verify_bilateral_parity(const float* h_in, const float* h_out, const BilateralConfig& cfg, float tol);
} // namespace cu_bilateral_filter_shared2d
