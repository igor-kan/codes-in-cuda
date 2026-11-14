/**
 * @file perf_simd.cu
 * @brief Multi-lane vectorization and loop unrolling for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

#include <stddef.h>

void warp_reduce_any_all_simd_unroll4_step(const double* restrict src, double* restrict dst, size_t n, double factor) {
    size_t i = 0;
    size_t unroll_limit = n & ~((size_t)3);
    for (; i < unroll_limit; i += 4) {
        dst[i+0] = src[i+0] * factor;
        dst[i+1] = src[i+1] * factor;
        dst[i+2] = src[i+2] * factor;
        dst[i+3] = src[i+3] * factor;
    }
    for (; i < n; ++i) {
        dst[i] = src[i] * factor;
    }
}
