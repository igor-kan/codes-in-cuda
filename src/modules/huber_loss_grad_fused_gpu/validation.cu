#include "interface.cuh"

namespace cu_huber_loss_grad_fused_gpu {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_huber_loss_grad_fused_gpu
