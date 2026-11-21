#include "interface.cuh"

namespace cu_bitonic_warp_sort_d56 {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_bitonic_warp_sort_d56
