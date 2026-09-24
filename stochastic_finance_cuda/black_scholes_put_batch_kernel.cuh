#pragma once
#include <cuda_runtime.h>

__global__ void bs_put_pricing_kernel(const float* S, const float* K, float T, float r, float sigma, float* put_price, int n);
