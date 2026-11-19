#include "interface.cuh"

namespace cu_stencil_5pt_halo_tiled {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_stencil_5pt_halo_tiled
