#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_bilateral_1d_range_cuda {
void launch_bilateral_1d(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_bilateral_1d_range_cuda
