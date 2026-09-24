#pragma once
#include <cuda_runtime.h>

__global__ void trinomial_step_kernel(float* V, const float* payoff, float disc, float pu, float pm, float pd, int n);
