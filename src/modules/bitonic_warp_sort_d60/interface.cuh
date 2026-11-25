#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_bitonic_warp_sort_d60 {
__global__ void bitonic_sort_256_d60(const float* in, float* out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_bitonic_warp_sort_d60
