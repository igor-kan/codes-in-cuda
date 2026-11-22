#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_dot_prod_warp_shfl_d57 {
__global__ void dot_warp_kernel(const float* d_a, float* d_b, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_dot_prod_warp_shfl_d57
