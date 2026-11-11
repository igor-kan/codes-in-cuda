/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline.
 * Module: warp_matrix_tensor_bf16
 */

#include <assert.h>
#include <math.h>

static inline void warp_matrix_tensor_bf16_verify_contract_day47(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
