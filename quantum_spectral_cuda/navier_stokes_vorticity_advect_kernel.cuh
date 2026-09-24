#pragma once
#include <cuda_runtime.h>

__global__ void vorticity_advect_kernel(const float* w, float* w_next, const float* u, const float* v, int nx, int ny, float dt_2dx);
