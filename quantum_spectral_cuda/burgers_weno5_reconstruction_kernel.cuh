#pragma once
#include <cuda_runtime.h>

__global__ void weno5_flux_split_kernel(const float* u, float* f_plus, float* f_minus, int n);
