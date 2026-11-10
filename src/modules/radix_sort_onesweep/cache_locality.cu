/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

#define RADIX_SORT_ONESWEEP_CACHE_LINE 64
#define RADIX_SORT_ONESWEEP_TILE_DIM 32

void radix_sort_onesweep_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += RADIX_SORT_ONESWEEP_TILE_DIM) {
        size_t r_end = (r + RADIX_SORT_ONESWEEP_TILE_DIM < rows) ? r + RADIX_SORT_ONESWEEP_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00003;
            }
        }
    }
}
