/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Grid Cooperative 2D Matrix Transpose with Bank Padding.
 * Module: cooperative_matrix_transpose
 */

#include <assert.h>
#include <math.h>

static inline void cooperative_matrix_transpose_verify_contract_day47(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
