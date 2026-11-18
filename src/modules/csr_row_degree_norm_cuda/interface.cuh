#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_csr_row_degree_norm_cuda {
void launch_degree_norm(const float* d_deg, float* d_val, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_csr_row_degree_norm_cuda
