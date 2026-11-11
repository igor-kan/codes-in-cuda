/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for CUDA Stream-Ordered Memory Allocator Pipeline.
 * Module: stream_ordered_memory_alloc
 */

#include <assert.h>
#include <math.h>

static inline void stream_ordered_memory_alloc_verify_contract_day47(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
