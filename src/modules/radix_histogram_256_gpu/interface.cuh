#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_radix_histogram_256_gpu {
void launch_radix_hist(const float* d_in, float* d_bins, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_radix_histogram_256_gpu
