#pragma once
#include <cuda_runtime.h>

__global__ void pnl_scale_kernel(float* pnl, float portfolio_val, int n);
