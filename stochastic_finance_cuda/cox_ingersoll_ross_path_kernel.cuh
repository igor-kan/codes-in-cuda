#pragma once
#include <cuda_runtime.h>

__global__ void cir_step_kernel(float* R, const float* dW, float k, float theta, float sigma, float dt, int n);
