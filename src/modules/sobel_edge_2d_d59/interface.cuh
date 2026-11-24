#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_sobel_edge_2d_d59 {
__global__ void sobel_grad2d_kernel(const float* d_in, float* d_out, int w, int h);

KernelStatus validate_grid_dim(int n);
} // namespace cu_sobel_edge_2d_d59
