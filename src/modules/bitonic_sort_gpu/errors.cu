/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for Shared-Memory GPU Bitonic Sorting Network.
 * Module: bitonic_sort_gpu
 */

typedef enum bitonic_sort_gpu_error {
    BITONIC_SORT_GPU_OK = 0,
    BITONIC_SORT_GPU_ERR_NULL = -100,
    BITONIC_SORT_GPU_ERR_CAPACITY = -101,
    BITONIC_SORT_GPU_ERR_CONVERGENCE = -102
} bitonic_sort_gpu_error_t;

const char* bitonic_sort_gpu_strerror(bitonic_sort_gpu_error_t err) {
    switch (err) {
        case BITONIC_SORT_GPU_OK: return "Success";
        case BITONIC_SORT_GPU_ERR_NULL: return "Encountered null pointer argument";
        case BITONIC_SORT_GPU_ERR_CAPACITY: return "Capacity limit exceeded";
        case BITONIC_SORT_GPU_ERR_CONVERGENCE: return "Numerical algorithm failed to converge";
        default: return "Unknown error";
    }
}
