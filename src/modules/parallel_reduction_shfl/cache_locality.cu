/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

#define PARALLEL_REDUCTION_SHFL_CACHE_LINE_SIZE 64
#define PARALLEL_REDUCTION_SHFL_L1_TILE_SIZE 32

void parallel_reduction_shfl_cache_tiled_transform(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += PARALLEL_REDUCTION_SHFL_L1_TILE_SIZE) {
        size_t r_end = (r + PARALLEL_REDUCTION_SHFL_L1_TILE_SIZE < rows) ? r + PARALLEL_REDUCTION_SHFL_L1_TILE_SIZE : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.0001;
            }
        }
    }
}
