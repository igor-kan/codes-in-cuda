#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_transpose_tiled_smem_d56 {
__global__ void transpose_tile_kernel(const float* d_in, float* d_out, int width);

KernelStatus validate_grid_dim(int n);
} // namespace cu_transpose_tiled_smem_d56
