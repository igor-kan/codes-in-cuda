#include "interface.cuh"
#include <cassert>
#include <cmath>

namespace cu_dot_prod_warp_shfl_d57 {

void verify_finite_output(const float* host_buf, int n) {
    for (int i = 0; i < n; ++i) {
        assert(std::isfinite(host_buf[i]));
    }
}

} // namespace cu_dot_prod_warp_shfl_d57
