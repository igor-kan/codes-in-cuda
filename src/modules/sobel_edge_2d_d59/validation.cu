#include "interface.cuh"

namespace cu_sobel_edge_2d_d59 {

KernelStatus validate_grid_dim(int n) {
    if (n <= 0) {
        return KernelStatus::InvalidDimension;
    }
    return KernelStatus::Ok;
}

} // namespace cu_sobel_edge_2d_d59
