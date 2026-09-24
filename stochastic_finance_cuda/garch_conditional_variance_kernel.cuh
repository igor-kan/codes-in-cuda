#pragma once
#include <cuda_runtime.h>

__global__ void garch_update_kernel(float* sigma2, const float* eps, float omega, float alpha, float beta, int n);
