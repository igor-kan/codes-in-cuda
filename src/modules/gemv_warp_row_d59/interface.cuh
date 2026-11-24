#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_gemv_warp_row_d59 {
__global__ void warp_gemv_kernel(const float* d_mat, const float* d_vec, float* d_out, int rows, int cols);

KernelStatus validate_grid_dim(int n);
} // namespace cu_gemv_warp_row_d59
