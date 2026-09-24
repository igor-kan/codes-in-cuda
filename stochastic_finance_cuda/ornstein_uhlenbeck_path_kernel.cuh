#pragma once
#include <cuda_runtime.h>

__global__ void ou_euler_step_kernel(float* X, const float* dW, float theta, float mu, float sigma, float dt, int n);
