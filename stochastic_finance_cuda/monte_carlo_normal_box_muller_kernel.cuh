#pragma once
#include <cuda_runtime.h>

__global__ void box_muller_transform_kernel(const float* u1, const float* u2, float* z1, float* z2, int n);
