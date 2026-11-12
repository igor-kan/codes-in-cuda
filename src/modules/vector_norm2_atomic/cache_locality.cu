/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic
 */

#define VECTOR_NORM2_ATOMIC_CACHELINE_SIZE 64
#define VECTOR_NORM2_ATOMIC_BLOCK_SIZE 32

void vector_norm2_atomic_cache_blocked_operation(const double* in_mat, double* out_mat, size_t n) {
    for (size_t bi = 0; bi < n; bi += VECTOR_NORM2_ATOMIC_BLOCK_SIZE) {
        size_t bi_end = (bi + VECTOR_NORM2_ATOMIC_BLOCK_SIZE < n) ? (bi + VECTOR_NORM2_ATOMIC_BLOCK_SIZE) : n;
        for (size_t bj = 0; bj < n; bj += VECTOR_NORM2_ATOMIC_BLOCK_SIZE) {
            size_t bj_end = (bj + VECTOR_NORM2_ATOMIC_BLOCK_SIZE < n) ? (bj + VECTOR_NORM2_ATOMIC_BLOCK_SIZE) : n;
            for (size_t i = bi; i < bi_end; ++i) {
                for (size_t j = bj; j < bj_end; ++j) {
                    out_mat[i * n + j] = in_mat[i * n + j] * 1.000001;
                }
            }
        }
    }
}
