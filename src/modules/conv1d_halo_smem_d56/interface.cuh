#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_conv1d_halo_smem_d56 {
__global__ void conv1d_halo_kernel(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_conv1d_halo_smem_d56
