#include "interface.cuh"
#include <cassert>
#include <cmath>
namespace cu_batched_tridiag_pcr_cuda {
void verify_tridiag_residual(const float* a, const float* b, const float* c, const float* d, const float* x, int n) {
    for (int i = 0; i < n; ++i) {
        float lhs = b[i] * x[i] + (i > 0 ? a[i] * x[i - 1] : 0.0f) + (i + 1 < n ? c[i] * x[i + 1] : 0.0f);
        assert(std::fabs(lhs - d[i]) < 1e-3f);
    }
}
} // namespace cu_batched_tridiag_pcr_cuda