#include "interface.cuh"

namespace cu_csr_row_degree_norm_cuda {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_csr_row_degree_norm_cuda
