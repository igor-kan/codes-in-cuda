#include "interface.cuh"

namespace cu_dense_gemv_shared_x_gpu {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_dense_gemv_shared_x_gpu
