#include "interface.cuh"

namespace cu_batched_givens_qr_2x2_gpu {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_batched_givens_qr_2x2_gpu
