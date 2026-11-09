/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for GPU Fast K-th Selection via Radix Partitioning.
 * Module: parallel_radix_select
 */

#define PARALLEL_RADIX_SELECT_CACHE_LINE 64
#define PARALLEL_RADIX_SELECT_TILE_DIM 32

void parallel_radix_select_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += PARALLEL_RADIX_SELECT_TILE_DIM) {
        size_t r_end = (r + PARALLEL_RADIX_SELECT_TILE_DIM < rows) ? r + PARALLEL_RADIX_SELECT_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00005;
            }
        }
    }
}
