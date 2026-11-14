/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

typedef enum warp_reduce_any_all_error_status {
    WARP_REDUCE_ANY_ALL_OK = 0,
    WARP_REDUCE_ANY_ALL_ERR_INVALID_PARAM = -10,
    WARP_REDUCE_ANY_ALL_ERR_CAPACITY_LIMIT = -11,
    WARP_REDUCE_ANY_ALL_ERR_NUMERICAL_FAULT = -12
} warp_reduce_any_all_error_status_t;

const char* warp_reduce_any_all_error_string(warp_reduce_any_all_error_status_t err) {
    switch (err) {
        case WARP_REDUCE_ANY_ALL_OK: return "Operational success";
        case WARP_REDUCE_ANY_ALL_ERR_INVALID_PARAM: return "Parameter domain precondition violated";
        case WARP_REDUCE_ANY_ALL_ERR_CAPACITY_LIMIT: return "Buffer capacity boundary reached";
        case WARP_REDUCE_ANY_ALL_ERR_NUMERICAL_FAULT: return "Numerical computation anomaly";
        default: return "Unknown module error code";
    }
}
