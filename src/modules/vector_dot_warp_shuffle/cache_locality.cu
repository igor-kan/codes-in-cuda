/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle
 */

#define VECTOR_DOT_WARP_SHUFFLE_LINE_SZ 64
#define VECTOR_DOT_WARP_SHUFFLE_TILE_SZ 32

void vector_dot_warp_shuffle_cacheline_blocked_stride(const double* in_data, double* out_data, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += VECTOR_DOT_WARP_SHUFFLE_TILE_SZ) {
        size_t r_max = (r + VECTOR_DOT_WARP_SHUFFLE_TILE_SZ < rows) ? (r + VECTOR_DOT_WARP_SHUFFLE_TILE_SZ) : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_max; ++i) {
                out_data[i * cols + c] = in_data[i * cols + c] * 1.000001;
            }
        }
    }
}
