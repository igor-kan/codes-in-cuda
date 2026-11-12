/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for Warp-Per-Row Dense Matrix-Vector Multiplication.
 * Module: dense_gemv_warp
 */

#include <assert.h>
#include <math.h>

static inline void dense_gemv_warp_check_invariants(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0 || fabs(output) < 1e-12);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
