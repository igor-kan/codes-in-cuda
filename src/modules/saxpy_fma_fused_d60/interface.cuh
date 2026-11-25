#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_saxpy_fma_fused_d60 {
__global__ void saxpy_fma_kernel_d60(const float* x, float* y, int n, float alpha, float beta);

KernelStatus validate_grid_dim(int n);
} // namespace cu_saxpy_fma_fused_d60
