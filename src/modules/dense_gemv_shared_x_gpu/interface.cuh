#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_dense_gemv_shared_x_gpu {
void launch_shared_gemv(const float* d_a, float* d_y, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_dense_gemv_shared_x_gpu
