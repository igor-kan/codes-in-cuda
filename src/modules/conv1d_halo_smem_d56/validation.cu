#include "interface.cuh"

namespace cu_conv1d_halo_smem_d56 {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_conv1d_halo_smem_d56
