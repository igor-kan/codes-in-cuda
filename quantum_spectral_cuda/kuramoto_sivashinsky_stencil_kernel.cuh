#pragma once
#include <cuda_runtime.h>

__global__ void ks_nonlinear_step_kernel(const float* u, float* u_next, float dt_dx, int n);
