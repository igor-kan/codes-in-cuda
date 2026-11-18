#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_huber_loss_grad_fused_gpu {
void launch_huber_grad(const float* d_err, float* d_grad, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_huber_loss_grad_fused_gpu
