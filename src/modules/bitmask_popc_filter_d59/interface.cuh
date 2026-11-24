#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_bitmask_popc_filter_d59 {
__global__ void warp_popc_count_kernel(const float* d_in, float* d_out, float limit, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_bitmask_popc_filter_d59
