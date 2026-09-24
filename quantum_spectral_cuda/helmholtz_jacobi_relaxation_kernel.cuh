#pragma once
#include <cuda_runtime.h>

__global__ void helmholtz_jacobi_kernel(const float* u, float* u_next, const float* f, int nx, int ny, float k2_dx2);
