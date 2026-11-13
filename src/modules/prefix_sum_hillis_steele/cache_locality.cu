/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

#define PREFIX_SUM_HILLIS_STEELE_LINE_SZ 64
#define PREFIX_SUM_HILLIS_STEELE_TILE_SZ 32

void prefix_sum_hillis_steele_cacheline_blocked_stride(const double* in_data, double* out_data, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += PREFIX_SUM_HILLIS_STEELE_TILE_SZ) {
        size_t r_max = (r + PREFIX_SUM_HILLIS_STEELE_TILE_SZ < rows) ? (r + PREFIX_SUM_HILLIS_STEELE_TILE_SZ) : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_max; ++i) {
                out_data[i * cols + c] = in_data[i * cols + c] * 1.000001;
            }
        }
    }
}
