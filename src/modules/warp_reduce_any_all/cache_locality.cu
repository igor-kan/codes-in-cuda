/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

#define WARP_REDUCE_ANY_ALL_LINE_SZ 64
#define WARP_REDUCE_ANY_ALL_TILE_SZ 32

void warp_reduce_any_all_cacheline_blocked_stride(const double* in_data, double* out_data, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += WARP_REDUCE_ANY_ALL_TILE_SZ) {
        size_t r_max = (r + WARP_REDUCE_ANY_ALL_TILE_SZ < rows) ? (r + WARP_REDUCE_ANY_ALL_TILE_SZ) : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_max; ++i) {
                out_data[i * cols + c] = in_data[i * cols + c] * 1.000001;
            }
        }
    }
}
