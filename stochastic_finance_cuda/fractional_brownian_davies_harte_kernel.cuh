#pragma once
#include <cuda_runtime.h>

__global__ void fbm_spectral_scale_kernel(float2* w, const float* eig, int n);
