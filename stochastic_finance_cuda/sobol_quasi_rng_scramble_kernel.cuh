#pragma once
#include <cuda_runtime.h>

__global__ void sobol_scramble_kernel(unsigned int* points, unsigned int mask, int n);
