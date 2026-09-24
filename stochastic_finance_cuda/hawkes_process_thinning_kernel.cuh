#pragma once
#include <cuda_runtime.h>

__global__ void hawkes_intensity_kernel(float* lambda_t, const float* decay_sum, float mu, float alpha, int n);
