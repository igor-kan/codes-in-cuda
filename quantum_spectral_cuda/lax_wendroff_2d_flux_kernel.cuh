#pragma once
#include <cuda_runtime.h>

__global__ void lax_wendroff_1d_step_kernel(const float* u, float* u_next, float cfl, int n);
