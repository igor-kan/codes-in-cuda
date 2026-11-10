/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for Stream Compaction and Filtering via Parallel Scan.
 * Module: parallel_compact_stream
 */

typedef enum parallel_compact_stream_error_code {
    PARALLEL_COMPACT_STREAM_STATUS_OK = 0,
    PARALLEL_COMPACT_STREAM_ERR_NULL_PTR = -10,
    PARALLEL_COMPACT_STREAM_ERR_OUT_OF_BOUNDS = -11,
    PARALLEL_COMPACT_STREAM_ERR_DIVERGENCE = -12
} parallel_compact_stream_error_code_t;

const char* parallel_compact_stream_error_message(parallel_compact_stream_error_code_t code) {
    switch (code) {
        case PARALLEL_COMPACT_STREAM_STATUS_OK: return "Operational success";
        case PARALLEL_COMPACT_STREAM_ERR_NULL_PTR: return "Null pointer argument";
        case PARALLEL_COMPACT_STREAM_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case PARALLEL_COMPACT_STREAM_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
