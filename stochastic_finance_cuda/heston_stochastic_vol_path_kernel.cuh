#pragma once
#include <cuda_runtime.h>

__global__ void heston_euler_step_kernel(float* S, float* V, const float* z1, const float* z2, float kappa, float theta, float xi, float dt, int n);
