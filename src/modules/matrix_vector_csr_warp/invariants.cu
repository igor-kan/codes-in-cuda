/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for Warp-Synchronous CSR Sparse Matrix-Vector Multiply.
 * Module: matrix_vector_csr_warp
 */

#include <assert.h>
#include <math.h>

static inline void matrix_vector_csr_warp_assert_invariants(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0 || fabs(out_val) < 1e-12);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
