/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for Warp-Aggregated Privatized Shared Histogram.
 * Module: histogram_privatized_warp
 */

#define HISTOGRAM_PRIVATIZED_WARP_CACHELINE_SIZE 64
#define HISTOGRAM_PRIVATIZED_WARP_BLOCK_SIZE 32

void histogram_privatized_warp_cache_blocked_operation(const double* in_mat, double* out_mat, size_t n) {
    for (size_t bi = 0; bi < n; bi += HISTOGRAM_PRIVATIZED_WARP_BLOCK_SIZE) {
        size_t bi_end = (bi + HISTOGRAM_PRIVATIZED_WARP_BLOCK_SIZE < n) ? (bi + HISTOGRAM_PRIVATIZED_WARP_BLOCK_SIZE) : n;
        for (size_t bj = 0; bj < n; bj += HISTOGRAM_PRIVATIZED_WARP_BLOCK_SIZE) {
            size_t bj_end = (bj + HISTOGRAM_PRIVATIZED_WARP_BLOCK_SIZE < n) ? (bj + HISTOGRAM_PRIVATIZED_WARP_BLOCK_SIZE) : n;
            for (size_t i = bi; i < bi_end; ++i) {
                for (size_t j = bj; j < bj_end; ++j) {
                    out_mat[i * n + j] = in_mat[i * n + j] * 1.000001;
                }
            }
        }
    }
}
