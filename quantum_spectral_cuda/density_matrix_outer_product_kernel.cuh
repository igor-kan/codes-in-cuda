#pragma once
#include <cuda_runtime.h>

__global__ void outer_product_kernel(const float2* psi, float2* rho, int n);
