#pragma once
#include <cuda_runtime.h>

__global__ void chebyshev_elementwise_product(float* out, const float* D, const float* u, int n);
