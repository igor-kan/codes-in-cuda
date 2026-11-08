/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for GPU Segmented Work-Efficient Prefix Scan.
 * Module: segmented_scan_gpu
 */

typedef enum segmented_scan_gpu_error {
    SEGMENTED_SCAN_GPU_OK = 0,
    SEGMENTED_SCAN_GPU_ERR_NULL = -100,
    SEGMENTED_SCAN_GPU_ERR_CAPACITY = -101,
    SEGMENTED_SCAN_GPU_ERR_CONVERGENCE = -102
} segmented_scan_gpu_error_t;

const char* segmented_scan_gpu_strerror(segmented_scan_gpu_error_t err) {
    switch (err) {
        case SEGMENTED_SCAN_GPU_OK: return "Success";
        case SEGMENTED_SCAN_GPU_ERR_NULL: return "Encountered null pointer argument";
        case SEGMENTED_SCAN_GPU_ERR_CAPACITY: return "Capacity limit exceeded";
        case SEGMENTED_SCAN_GPU_ERR_CONVERGENCE: return "Numerical algorithm failed to converge";
        default: return "Unknown error";
    }
}
