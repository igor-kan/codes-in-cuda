/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for 2D Shared-Memory Tiled Matrix Multiplication Kernel.
 * Module: matrix_mul_shared_tiled
 */

#include <assert.h>
#include <math.h>

static inline void matrix_mul_shared_tiled_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0 || fabs(out_val) < 1e-12);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
