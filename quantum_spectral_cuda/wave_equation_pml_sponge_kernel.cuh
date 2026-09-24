#pragma once
#include <cuda_runtime.h>

__global__ void pml_sponge_boundary_kernel(float* u, const float* sigma_pml, int n);
