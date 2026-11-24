#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_warp_min_reduce_d59 {
__global__ void warp_min256_kernel(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_warp_min_reduce_d59
