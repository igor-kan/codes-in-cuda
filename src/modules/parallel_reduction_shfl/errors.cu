/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

typedef enum parallel_reduction_shfl_error {
    PARALLEL_REDUCTION_SHFL_OK = 0,
    PARALLEL_REDUCTION_SHFL_ERR_NULL = -100,
    PARALLEL_REDUCTION_SHFL_ERR_CAPACITY = -101,
    PARALLEL_REDUCTION_SHFL_ERR_CONVERGENCE = -102
} parallel_reduction_shfl_error_t;

const char* parallel_reduction_shfl_strerror(parallel_reduction_shfl_error_t err) {
    switch (err) {
        case PARALLEL_REDUCTION_SHFL_OK: return "Success";
        case PARALLEL_REDUCTION_SHFL_ERR_NULL: return "Encountered null pointer argument";
        case PARALLEL_REDUCTION_SHFL_ERR_CAPACITY: return "Capacity limit exceeded";
        case PARALLEL_REDUCTION_SHFL_ERR_CONVERGENCE: return "Numerical algorithm failed to converge";
        default: return "Unknown error";
    }
}
