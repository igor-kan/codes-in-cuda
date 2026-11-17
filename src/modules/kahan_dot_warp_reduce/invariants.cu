#include "interface.cuh"
#include <cassert>
#include <cmath>
namespace cu_kahan_dot_warp_reduce {
void verify_dot_fp64(const float* a, const float* b, int n, float gpu_dot) {
    double ref = 0.0;
    for (int i = 0; i < n; ++i) ref += static_cast<double>(a[i]) * static_cast<double>(b[i]);
    assert(std::fabs(static_cast<double>(gpu_dot) - ref) <= 1e-3 * std::fabs(ref) + 1e-4);
}
} // namespace cu_kahan_dot_warp_reduce