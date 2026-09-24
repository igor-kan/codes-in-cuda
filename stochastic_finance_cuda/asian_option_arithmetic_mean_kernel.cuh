#pragma once
#include <cuda_runtime.h>

__global__ void asian_running_sum_kernel(const float* S, float* S_sum, int n);
