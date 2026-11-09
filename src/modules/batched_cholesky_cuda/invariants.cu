/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Batched Small-Matrix Cholesky Decomposition.
 * Module: batched_cholesky_cuda
 */

#include <assert.h>
#include <math.h>

static inline void batched_cholesky_cuda_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
