#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_relu_softmax_act_d58 {
__global__ void leaky_relu_kernel(const float* d_in, float* d_out, float slope, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_relu_softmax_act_d58
