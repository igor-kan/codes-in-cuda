#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_radix_bit_partition_d56 {
__global__ void radix_bit_split_kernel(const float* d_in, float* d_out, int n, int bit_pos);

KernelStatus validate_grid_dim(int n);
} // namespace cu_radix_bit_partition_d56
