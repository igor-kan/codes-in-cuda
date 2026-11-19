#include "interface.cuh"

namespace cu_reduce_argmax_warp_cuda {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_reduce_argmax_warp_cuda
