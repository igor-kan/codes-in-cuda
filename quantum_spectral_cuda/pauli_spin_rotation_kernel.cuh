#pragma once
#include <cuda_runtime.h>

__global__ void pauli_z_rotation_kernel(float2* spinor_up, float2* spinor_dn, float theta, int n);
