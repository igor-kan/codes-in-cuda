#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_box_blur_clamp_2d_d57 {
__global__ void box_blur2d_kernel(const float* d_in, float* d_out, int w, int h);

KernelStatus validate_grid_dim(int n);
} // namespace cu_box_blur_clamp_2d_d57
