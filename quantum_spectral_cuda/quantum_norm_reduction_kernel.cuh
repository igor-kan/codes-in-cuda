#pragma once
#include <cuda_runtime.h>

__global__ void prob_density_kernel(const float2* psi, float* prob, int n);
