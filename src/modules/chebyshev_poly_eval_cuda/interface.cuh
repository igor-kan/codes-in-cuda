#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_chebyshev_poly_eval_cuda {
void launch_clenshaw_eval(const float* d_x, float* d_y, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_chebyshev_poly_eval_cuda
