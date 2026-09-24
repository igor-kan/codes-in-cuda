#pragma once
#include <cuda_runtime.h>

__global__ void allen_cahn_reaction_kernel(float* u, float dt, int n);
