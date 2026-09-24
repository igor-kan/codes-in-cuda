#pragma once
#include <cuda_runtime.h>

__global__ void block_prefix_sum_kernel(const float* in, float* out, int n);
