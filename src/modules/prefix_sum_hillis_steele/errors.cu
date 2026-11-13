/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

typedef enum prefix_sum_hillis_steele_error_status {
    PREFIX_SUM_HILLIS_STEELE_OK = 0,
    PREFIX_SUM_HILLIS_STEELE_ERR_INVALID_PARAM = -10,
    PREFIX_SUM_HILLIS_STEELE_ERR_CAPACITY_LIMIT = -11,
    PREFIX_SUM_HILLIS_STEELE_ERR_NUMERICAL_FAULT = -12
} prefix_sum_hillis_steele_error_status_t;

const char* prefix_sum_hillis_steele_error_string(prefix_sum_hillis_steele_error_status_t err) {
    switch (err) {
        case PREFIX_SUM_HILLIS_STEELE_OK: return "Operational success";
        case PREFIX_SUM_HILLIS_STEELE_ERR_INVALID_PARAM: return "Parameter domain precondition violated";
        case PREFIX_SUM_HILLIS_STEELE_ERR_CAPACITY_LIMIT: return "Buffer capacity boundary reached";
        case PREFIX_SUM_HILLIS_STEELE_ERR_NUMERICAL_FAULT: return "Numerical computation anomaly";
        default: return "Unknown module error code";
    }
}
