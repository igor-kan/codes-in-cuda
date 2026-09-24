#pragma once
#include <cuda_runtime.h>

__global__ void poisson_red_black_kernel(float* u, const float* rhs, int nx, int ny, int color);
