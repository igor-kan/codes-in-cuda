/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic
 */

#include <assert.h>
#include <math.h>

static inline void vector_norm2_atomic_check_invariants(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0 || fabs(output) < 1e-12);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
