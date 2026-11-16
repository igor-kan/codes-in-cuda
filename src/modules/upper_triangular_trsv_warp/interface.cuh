#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_upper_triangular_trsv_warp {
KernelStatus launch_trsv32_warp(const float* d_upper, const float* d_rhs, float* d_x, const Trsv32Config& cfg, cudaStream_t stream);
KernelStatus validate_trsv32(const Trsv32Config& cfg);
KernelStatus verify_trsv32_cpu(const float* h_u, const float* h_rhs, const float* h_x, int batch, float tol);
} // namespace cu_upper_triangular_trsv_warp
