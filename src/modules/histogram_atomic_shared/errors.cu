/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared
 */

typedef enum histogram_atomic_shared_error_status {
    HISTOGRAM_ATOMIC_SHARED_OK = 0,
    HISTOGRAM_ATOMIC_SHARED_ERR_INVALID_PARAM = -10,
    HISTOGRAM_ATOMIC_SHARED_ERR_CAPACITY_LIMIT = -11,
    HISTOGRAM_ATOMIC_SHARED_ERR_NUMERICAL_FAULT = -12
} histogram_atomic_shared_error_status_t;

const char* histogram_atomic_shared_error_string(histogram_atomic_shared_error_status_t err) {
    switch (err) {
        case HISTOGRAM_ATOMIC_SHARED_OK: return "Operational success";
        case HISTOGRAM_ATOMIC_SHARED_ERR_INVALID_PARAM: return "Parameter domain precondition violated";
        case HISTOGRAM_ATOMIC_SHARED_ERR_CAPACITY_LIMIT: return "Buffer capacity boundary reached";
        case HISTOGRAM_ATOMIC_SHARED_ERR_NUMERICAL_FAULT: return "Numerical computation anomaly";
        default: return "Unknown module error code";
    }
}
