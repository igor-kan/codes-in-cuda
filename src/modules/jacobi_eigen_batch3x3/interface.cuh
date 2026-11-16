#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_jacobi_eigen_batch3x3 {
KernelStatus launch_batched_eigen3x3(const float* d_sym6, float* d_eval3, float* d_evec9, const BatchEigenConfig& cfg, cudaStream_t stream);
KernelStatus validate_eigen3x3_cfg(const BatchEigenConfig& cfg);
KernelStatus verify_eigen3x3_parity(const float* h_sym6, const float* h_eval3, const float* h_evec9, int count, float tol);
} // namespace cu_jacobi_eigen_batch3x3
