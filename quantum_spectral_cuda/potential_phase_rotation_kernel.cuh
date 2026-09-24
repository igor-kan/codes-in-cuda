#pragma once
#include <cuda_runtime.h>

__global__ void phase_rotation_kernel(float2* state, float phase, int n);
