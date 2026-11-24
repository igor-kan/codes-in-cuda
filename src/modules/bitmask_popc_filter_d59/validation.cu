#include "interface.cuh"

namespace cu_bitmask_popc_filter_d59 {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_bitmask_popc_filter_d59
