/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Grid-Wide Cooperative Barrier Synchronization.
 * Module: cooperative_groups_grid
 */

#include <assert.h>
#include <math.h>

static inline void cooperative_groups_grid_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
