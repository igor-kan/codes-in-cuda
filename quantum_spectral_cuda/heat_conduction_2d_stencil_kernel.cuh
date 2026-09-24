#pragma once
#include <cuda_runtime.h>

__global__ void heat_diffusion_2d_kernel(const float* u, float* u_next, int nx, int ny, float alpha_r);
