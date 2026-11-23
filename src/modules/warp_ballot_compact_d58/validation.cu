#include "interface.cuh"

namespace cu_warp_ballot_compact_d58 {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_warp_ballot_compact_d58
