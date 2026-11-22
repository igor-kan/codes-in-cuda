#include "interface.cuh"

namespace cu_saxpy_grid_stride_d57 {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_saxpy_grid_stride_d57
