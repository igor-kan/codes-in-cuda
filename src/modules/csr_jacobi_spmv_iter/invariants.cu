#include "interface.cuh"
#include <cassert>
#include <cmath>
namespace cu_csr_jacobi_spmv_iter {
void verify_diag_dominant_residual(const int* rp, const int* ci, const float* val, const float* b, const float* x, int rows, float tol) {
    for (int r = 0; r < rows; ++r) {
        float ax = 0.0f;
        for (int e = rp[r]; e < rp[r + 1]; ++e) ax += val[e] * x[ci[e]];
        assert(std::fabs(ax - b[r]) <= tol);
    }
}
} // namespace cu_csr_jacobi_spmv_iter