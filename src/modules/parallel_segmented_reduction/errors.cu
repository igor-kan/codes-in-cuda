/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for GPU Segmented Parallel Reduction with Key Arrays.
 * Module: parallel_segmented_reduction
 */

typedef enum parallel_segmented_reduction_error_code {
    PARALLEL_SEGMENTED_REDUCTION_STATUS_OK = 0,
    PARALLEL_SEGMENTED_REDUCTION_ERR_NULL_PTR = -20,
    PARALLEL_SEGMENTED_REDUCTION_ERR_OUT_OF_BOUNDS = -21,
    PARALLEL_SEGMENTED_REDUCTION_ERR_DIVERGENCE = -22
} parallel_segmented_reduction_error_code_t;

const char* parallel_segmented_reduction_error_message(parallel_segmented_reduction_error_code_t code) {
    switch (code) {
        case PARALLEL_SEGMENTED_REDUCTION_STATUS_OK: return "Operational success";
        case PARALLEL_SEGMENTED_REDUCTION_ERR_NULL_PTR: return "Null pointer argument";
        case PARALLEL_SEGMENTED_REDUCTION_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case PARALLEL_SEGMENTED_REDUCTION_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
