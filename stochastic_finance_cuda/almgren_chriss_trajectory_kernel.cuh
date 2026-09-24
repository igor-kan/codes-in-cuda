#pragma once
#include <cuda_runtime.h>

__global__ void almgren_inventory_kernel(float* inventory, float X_total, float kappa, float T, float dt, int n);
