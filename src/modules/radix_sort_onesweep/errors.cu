/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

typedef enum radix_sort_onesweep_error_code {
    RADIX_SORT_ONESWEEP_STATUS_OK = 0,
    RADIX_SORT_ONESWEEP_ERR_NULL_PTR = -10,
    RADIX_SORT_ONESWEEP_ERR_OUT_OF_BOUNDS = -11,
    RADIX_SORT_ONESWEEP_ERR_DIVERGENCE = -12
} radix_sort_onesweep_error_code_t;

const char* radix_sort_onesweep_error_message(radix_sort_onesweep_error_code_t code) {
    switch (code) {
        case RADIX_SORT_ONESWEEP_STATUS_OK: return "Operational success";
        case RADIX_SORT_ONESWEEP_ERR_NULL_PTR: return "Null pointer argument";
        case RADIX_SORT_ONESWEEP_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case RADIX_SORT_ONESWEEP_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
