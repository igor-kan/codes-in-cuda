#include "interface.cuh"

namespace cu_saxpy_fma_fused_d60 {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_saxpy_fma_fused_d60
