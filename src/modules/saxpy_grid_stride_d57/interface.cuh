#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_saxpy_grid_stride_d57 {
__global__ void saxpy_stride_kernel(const float* d_x, float* d_y, float alpha, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_saxpy_grid_stride_d57
