#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_histogram_shared_atom_d57 {
__global__ void hist_shared16_kernel(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_histogram_shared_atom_d57
