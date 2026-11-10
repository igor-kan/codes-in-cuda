/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for Stream Compaction and Filtering via Parallel Scan.
 * Module: parallel_compact_stream
 */

#define PARALLEL_COMPACT_STREAM_CACHE_LINE 64
#define PARALLEL_COMPACT_STREAM_TILE_DIM 32

void parallel_compact_stream_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += PARALLEL_COMPACT_STREAM_TILE_DIM) {
        size_t r_end = (r + PARALLEL_COMPACT_STREAM_TILE_DIM < rows) ? r + PARALLEL_COMPACT_STREAM_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00003;
            }
        }
    }
}
