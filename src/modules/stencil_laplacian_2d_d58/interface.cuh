#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_stencil_laplacian_2d_d58 {
__global__ void laplacian_5pt_kernel(const float* d_in, float* d_out, int w, int h);

KernelStatus validate_grid_dim(int n);
} // namespace cu_stencil_laplacian_2d_d58
