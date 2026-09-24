#pragma once
#include <cuda_runtime.h>

__global__ void bessel_j0_kernel(float* j0, const float* r, int n);
