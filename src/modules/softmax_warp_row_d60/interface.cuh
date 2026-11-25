#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_softmax_warp_row_d60 {
__global__ void softmax_warp_kernel_d60(const float* x, float* out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_softmax_warp_row_d60
