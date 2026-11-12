/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for Shared Memory Matrix Transpose with Bank Padding.
 * Module: matrix_transpose_pad
 */

#include <assert.h>
#include <math.h>

static inline void matrix_transpose_pad_check_invariants(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0 || fabs(output) < 1e-12);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
