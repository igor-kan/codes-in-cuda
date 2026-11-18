#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_batched_givens_qr_2x2_gpu {
void launch_batched_givens(const float* d_in, float* d_out, int batch);

KernelStatus validate_grid_dim(int n);
} // namespace cu_batched_givens_qr_2x2_gpu
