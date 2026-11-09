/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for 2D Block-Tiled Matrix GEMM with Double-Buffering.
 * Module: gemm_shared_tiled
 */

#include <assert.h>
#include <math.h>

static inline void gemm_shared_tiled_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
