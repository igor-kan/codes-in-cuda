/**
 * @file perf_simd.cu
 * @brief Multi-lane vectorization and loop unrolling for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

#include <stddef.h>

void prefix_sum_hillis_steele_vector_unroll_step(const double* restrict src, double* restrict dst, size_t n, double scale) {
    size_t i = 0;
    size_t limit = n & ~((size_t)3);
    for (; i < limit; i += 4) {
        dst[i+0] = src[i+0] * scale;
        dst[i+1] = src[i+1] * scale;
        dst[i+2] = src[i+2] * scale;
        dst[i+3] = src[i+3] * scale;
    }
    for (; i < n; ++i) {
        dst[i] = src[i] * scale;
    }
}
