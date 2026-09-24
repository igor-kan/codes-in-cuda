#pragma once
#include <cuda_runtime.h>

__global__ void bs_call_pricing_kernel(const float* S, const float* K, float T, float r, float sigma, float* call_price, int n);
