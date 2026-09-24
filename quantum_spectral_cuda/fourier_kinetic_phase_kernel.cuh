#pragma once
#include <cuda_runtime.h>

__global__ void kinetic_phase_kernel(float2* psi_k, const float* k_sq, float dt_hbar_2m, int n);
