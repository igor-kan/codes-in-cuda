/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Grid Cooperative 2D Matrix Transpose with Bank Padding.
 * Module: cooperative_matrix_transpose
 */

#include <stdint.h>

#define COOPERATIVE_MATRIX_TRANSPOSE_BENCH_SAMPLES 100000

typedef struct cooperative_matrix_transpose_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} cooperative_matrix_transpose_bench_stats_t;
