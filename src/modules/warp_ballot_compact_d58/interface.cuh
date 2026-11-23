#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_warp_ballot_compact_d58 {
__global__ void warp_compact_kernel(const float* d_in, float* d_out, float thresh, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_warp_ballot_compact_d58
