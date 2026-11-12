/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for Warp-Synchronous Inclusive Prefix Scan via Shuffles.
 * Module: warp_shfl_scan
 */

#include <assert.h>
#include <math.h>

static inline void warp_shfl_scan_check_invariants(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0 || fabs(output) < 1e-12);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
