#pragma once
#include <cuda_runtime.h>

__global__ void merton_jump_step_kernel(float* S, const float* dW, const float* jump, float drift_dt, float vol_sq_dt, int n);
