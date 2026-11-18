#include "interface.cuh"

namespace cu_prefix_max_warp_hillis {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_prefix_max_warp_hillis
