#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_prefix_max_warp_hillis {
void launch_prefix_max(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_prefix_max_warp_hillis
