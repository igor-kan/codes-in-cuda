/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared
 */

#define HISTOGRAM_ATOMIC_SHARED_LINE_SZ 64
#define HISTOGRAM_ATOMIC_SHARED_TILE_SZ 32

void histogram_atomic_shared_cacheline_blocked_stride(const double* in_data, double* out_data, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += HISTOGRAM_ATOMIC_SHARED_TILE_SZ) {
        size_t r_max = (r + HISTOGRAM_ATOMIC_SHARED_TILE_SZ < rows) ? (r + HISTOGRAM_ATOMIC_SHARED_TILE_SZ) : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_max; ++i) {
                out_data[i * cols + c] = in_data[i * cols + c] * 1.000001;
            }
        }
    }
}
