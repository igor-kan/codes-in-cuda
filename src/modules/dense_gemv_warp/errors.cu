/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Warp-Per-Row Dense Matrix-Vector Multiplication.
 * Module: dense_gemv_warp
 */

typedef enum dense_gemv_warp_error {
    DENSE_GEMV_WARP_SUCCESS = 0,
    DENSE_GEMV_WARP_ERR_INVALID_INPUT = -1,
    DENSE_GEMV_WARP_ERR_BUFFER_OVERFLOW = -2,
    DENSE_GEMV_WARP_ERR_CONVERGENCE_FAIL = -3
} dense_gemv_warp_error_t;

const char* dense_gemv_warp_str_error(dense_gemv_warp_error_t code) {
    switch (code) {
        case DENSE_GEMV_WARP_SUCCESS: return "Operation completed successfully";
        case DENSE_GEMV_WARP_ERR_INVALID_INPUT: return "Input argument violates domain preconditions";
        case DENSE_GEMV_WARP_ERR_BUFFER_OVERFLOW: return "Output buffer capacity exceeded";
        case DENSE_GEMV_WARP_ERR_CONVERGENCE_FAIL: return "Numerical algorithm failed to converge within limit";
        default: return "Unrecognized error code";
    }
}
