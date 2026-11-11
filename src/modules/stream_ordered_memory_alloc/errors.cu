/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for CUDA Stream-Ordered Memory Allocator Pipeline.
 * Module: stream_ordered_memory_alloc
 */

typedef enum stream_ordered_memory_alloc_error_code {
    STREAM_ORDERED_MEMORY_ALLOC_STATUS_OK = 0,
    STREAM_ORDERED_MEMORY_ALLOC_ERR_NULL_PTR = -20,
    STREAM_ORDERED_MEMORY_ALLOC_ERR_OUT_OF_BOUNDS = -21,
    STREAM_ORDERED_MEMORY_ALLOC_ERR_DIVERGENCE = -22
} stream_ordered_memory_alloc_error_code_t;

const char* stream_ordered_memory_alloc_error_message(stream_ordered_memory_alloc_error_code_t code) {
    switch (code) {
        case STREAM_ORDERED_MEMORY_ALLOC_STATUS_OK: return "Operational success";
        case STREAM_ORDERED_MEMORY_ALLOC_ERR_NULL_PTR: return "Null pointer argument";
        case STREAM_ORDERED_MEMORY_ALLOC_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case STREAM_ORDERED_MEMORY_ALLOC_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
