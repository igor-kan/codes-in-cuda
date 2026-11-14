/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle
 */

typedef enum vector_dot_warp_shuffle_error_status {
    VECTOR_DOT_WARP_SHUFFLE_OK = 0,
    VECTOR_DOT_WARP_SHUFFLE_ERR_INVALID_PARAM = -10,
    VECTOR_DOT_WARP_SHUFFLE_ERR_CAPACITY_LIMIT = -11,
    VECTOR_DOT_WARP_SHUFFLE_ERR_NUMERICAL_FAULT = -12
} vector_dot_warp_shuffle_error_status_t;

const char* vector_dot_warp_shuffle_error_string(vector_dot_warp_shuffle_error_status_t err) {
    switch (err) {
        case VECTOR_DOT_WARP_SHUFFLE_OK: return "Operational success";
        case VECTOR_DOT_WARP_SHUFFLE_ERR_INVALID_PARAM: return "Parameter domain precondition violated";
        case VECTOR_DOT_WARP_SHUFFLE_ERR_CAPACITY_LIMIT: return "Buffer capacity boundary reached";
        case VECTOR_DOT_WARP_SHUFFLE_ERR_NUMERICAL_FAULT: return "Numerical computation anomaly";
        default: return "Unknown module error code";
    }
}
