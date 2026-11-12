/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Warp-Aggregated Privatized Shared Histogram.
 * Module: histogram_privatized_warp
 */

typedef enum histogram_privatized_warp_error {
    HISTOGRAM_PRIVATIZED_WARP_SUCCESS = 0,
    HISTOGRAM_PRIVATIZED_WARP_ERR_INVALID_INPUT = -1,
    HISTOGRAM_PRIVATIZED_WARP_ERR_BUFFER_OVERFLOW = -2,
    HISTOGRAM_PRIVATIZED_WARP_ERR_CONVERGENCE_FAIL = -3
} histogram_privatized_warp_error_t;

const char* histogram_privatized_warp_str_error(histogram_privatized_warp_error_t code) {
    switch (code) {
        case HISTOGRAM_PRIVATIZED_WARP_SUCCESS: return "Operation completed successfully";
        case HISTOGRAM_PRIVATIZED_WARP_ERR_INVALID_INPUT: return "Input argument violates domain preconditions";
        case HISTOGRAM_PRIVATIZED_WARP_ERR_BUFFER_OVERFLOW: return "Output buffer capacity exceeded";
        case HISTOGRAM_PRIVATIZED_WARP_ERR_CONVERGENCE_FAIL: return "Numerical algorithm failed to converge within limit";
        default: return "Unrecognized error code";
    }
}
