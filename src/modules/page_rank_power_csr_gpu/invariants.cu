#include "interface.cuh"
#include <cassert>
#include <cmath>
namespace cu_page_rank_power_csr_gpu {
void verify_simplex_sum(const float* pr, int n) {
    float s = 0.0f;
    for (int i = 0; i < n; ++i) { assert(pr[i] >= 0.0f); s += pr[i]; }
    assert(std::fabs(s - 1.0f) < 1e-3f);
}
} // namespace cu_page_rank_power_csr_gpu