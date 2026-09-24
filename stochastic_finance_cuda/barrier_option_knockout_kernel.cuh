#pragma once
#include <cuda_runtime.h>

__global__ void barrier_knockout_check_kernel(const float* S, int* active, float barrier, int n);
