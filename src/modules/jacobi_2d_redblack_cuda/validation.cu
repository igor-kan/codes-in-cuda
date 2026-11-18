#include "interface.cuh"

namespace cu_jacobi_2d_redblack_cuda {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_jacobi_2d_redblack_cuda
