#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_sell_c_sigma_spmv_cuda {
void launch_sell32_spmv(const float* d_val, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_sell_c_sigma_spmv_cuda
