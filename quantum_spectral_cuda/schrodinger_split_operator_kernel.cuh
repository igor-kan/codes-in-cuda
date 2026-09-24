#pragma once
#include <cuda_runtime.h>

__global__ void schrodinger_potential_phase_kernel(float2* psi, const float* V, float dt_hbar, int n);
