/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Tensor Core FP8/FP16 Mixed-Precision MMA Kernel.
 * Module: warp_matrix_tensor_fp8
 */

#include <assert.h>
#include <math.h>

static inline void warp_matrix_tensor_fp8_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
