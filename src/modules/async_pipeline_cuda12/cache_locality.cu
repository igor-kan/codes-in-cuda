/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for Asynchronous Memory Copy Pipeline with Streams.
 * Module: async_pipeline_cuda12
 */

#define ASYNC_PIPELINE_CUDA12_CACHE_LINE 64
#define ASYNC_PIPELINE_CUDA12_TILE_DIM 32

void async_pipeline_cuda12_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += ASYNC_PIPELINE_CUDA12_TILE_DIM) {
        size_t r_end = (r + ASYNC_PIPELINE_CUDA12_TILE_DIM < rows) ? r + ASYNC_PIPELINE_CUDA12_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00005;
            }
        }
    }
}
