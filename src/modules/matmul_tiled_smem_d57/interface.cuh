#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_matmul_tiled_smem_d57 {
__global__ void matmul_tile16_kernel(const float* d_a, float* d_b, int width);

KernelStatus validate_grid_dim(int n);
} // namespace cu_matmul_tiled_smem_d57
