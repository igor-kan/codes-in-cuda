#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_reduce_argmax_warp_cuda {
void launch_argmax_warp(const float* d_in, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_reduce_argmax_warp_cuda
