/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Warp-Synchronous Inclusive Prefix Scan via Shuffles.
 * Module: warp_shfl_scan
 */

typedef enum warp_shfl_scan_error {
    WARP_SHFL_SCAN_SUCCESS = 0,
    WARP_SHFL_SCAN_ERR_INVALID_INPUT = -1,
    WARP_SHFL_SCAN_ERR_BUFFER_OVERFLOW = -2,
    WARP_SHFL_SCAN_ERR_CONVERGENCE_FAIL = -3
} warp_shfl_scan_error_t;

const char* warp_shfl_scan_str_error(warp_shfl_scan_error_t code) {
    switch (code) {
        case WARP_SHFL_SCAN_SUCCESS: return "Operation completed successfully";
        case WARP_SHFL_SCAN_ERR_INVALID_INPUT: return "Input argument violates domain preconditions";
        case WARP_SHFL_SCAN_ERR_BUFFER_OVERFLOW: return "Output buffer capacity exceeded";
        case WARP_SHFL_SCAN_ERR_CONVERGENCE_FAIL: return "Numerical algorithm failed to converge within limit";
        default: return "Unrecognized error code";
    }
}
