#pragma once
#include <cuda_runtime.h>

__global__ void bloch_dispersion_kernel(float* E, const float* k, float a, float t_hop, int n);
