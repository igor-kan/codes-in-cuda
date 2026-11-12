/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Shared Memory Matrix Transpose with Bank Padding.
 * Module: matrix_transpose_pad
 */

#include <stdint.h>

#define MATRIX_TRANSPOSE_PAD_BENCH_CYCLES 100000

typedef struct matrix_transpose_pad_profile_results {
    uint64_t start_tsc;
    uint64_t end_tsc;
    double ops_per_second;
} matrix_transpose_pad_profile_results_t;
