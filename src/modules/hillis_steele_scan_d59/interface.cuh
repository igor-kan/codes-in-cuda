#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_hillis_steele_scan_d59 {
__global__ void hillis_steele256_kernel(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_hillis_steele_scan_d59
