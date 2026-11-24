#include "interface.cuh"

namespace cu_hillis_steele_scan_d59 {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_hillis_steele_scan_d59
