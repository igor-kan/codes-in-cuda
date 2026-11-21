#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_reduce_warp_shfl_d56 {
__global__ void warp_shfl_reduce_kernel(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_reduce_warp_shfl_d56
