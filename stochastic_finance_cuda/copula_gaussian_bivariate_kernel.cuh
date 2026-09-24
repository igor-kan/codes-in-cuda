#pragma once
#include <cuda_runtime.h>

__global__ void correlated_normals_kernel(const float* z1, const float* z2, float* x2, float rho, int n);
