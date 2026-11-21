#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_blelloch_scan_warp_d56 {
__global__ void blelloch_scan_kernel(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_blelloch_scan_warp_d56
