#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_matmul_outer_tile_d58 {
__global__ void fma_matmul_kernel(const float* d_a, float* d_b, int width);

KernelStatus validate_grid_dim(int n);
} // namespace cu_matmul_outer_tile_d58
