#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_jacobi_2d_redblack_cuda {
void launch_redblack_sweep(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_jacobi_2d_redblack_cuda
