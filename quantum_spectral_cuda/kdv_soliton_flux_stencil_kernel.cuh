#pragma once
#include <cuda_runtime.h>

__global__ void kdv_advection_step_kernel(const float* u, float* u_next, float dt_dx, int n);
