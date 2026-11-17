#include "interface.cuh"
namespace cu_kahan_dot_warp_reduce {
KernelStatus validate_dot(int n) {
    if (n <= 0) return KernelStatus::InvalidDimension;
    return KernelStatus::Ok;
}
} // namespace cu_kahan_dot_warp_reduce