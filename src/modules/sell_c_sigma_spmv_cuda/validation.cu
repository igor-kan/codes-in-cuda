#include "interface.cuh"

namespace cu_sell_c_sigma_spmv_cuda {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_sell_c_sigma_spmv_cuda
