/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Warp Ballot Voting and Shuffle-Down Tree Reduction.
 * Module: warp_divergence_reduction
 */

typedef enum warp_divergence_reduction_error_status {
    WARP_DIVERGENCE_REDUCTION_OK = 0,
    WARP_DIVERGENCE_REDUCTION_ERR_INVALID_PARAM = -10,
    WARP_DIVERGENCE_REDUCTION_ERR_CAPACITY_LIMIT = -11,
    WARP_DIVERGENCE_REDUCTION_ERR_NUMERICAL_FAULT = -12
} warp_divergence_reduction_error_status_t;

const char* warp_divergence_reduction_error_string(warp_divergence_reduction_error_status_t err) {
    switch (err) {
        case WARP_DIVERGENCE_REDUCTION_OK: return "Operational success";
        case WARP_DIVERGENCE_REDUCTION_ERR_INVALID_PARAM: return "Parameter domain precondition violated";
        case WARP_DIVERGENCE_REDUCTION_ERR_CAPACITY_LIMIT: return "Buffer capacity boundary reached";
        case WARP_DIVERGENCE_REDUCTION_ERR_NUMERICAL_FAULT: return "Numerical computation anomaly";
        default: return "Unknown module error code";
    }
}
