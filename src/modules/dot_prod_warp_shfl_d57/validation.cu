#include "interface.cuh"

namespace cu_dot_prod_warp_shfl_d57 {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_dot_prod_warp_shfl_d57
