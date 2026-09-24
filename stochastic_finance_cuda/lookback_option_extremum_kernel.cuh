#pragma once
#include <cuda_runtime.h>

__global__ void lookback_running_max_kernel(const float* S, float* S_max, int n);
