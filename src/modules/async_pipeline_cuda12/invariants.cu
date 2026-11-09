/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Asynchronous Memory Copy Pipeline with Streams.
 * Module: async_pipeline_cuda12
 */

#include <assert.h>
#include <math.h>

static inline void async_pipeline_cuda12_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
