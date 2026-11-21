#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_bitonic_warp_sort_d56 {
__global__ void bitonic_sort256_kernel(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_bitonic_warp_sort_d56
