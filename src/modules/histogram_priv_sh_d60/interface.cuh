#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_histogram_priv_sh_d60 {
__global__ void hist_priv32_kernel_d60(const float* x, float* bins_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_histogram_priv_sh_d60
