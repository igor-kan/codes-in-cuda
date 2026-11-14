/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for 2D Shared-Memory Tiled Matrix Multiplication Kernel.
 * Module: matrix_mul_shared_tiled
 */

#include <stdint.h>

#define MATRIX_MUL_SHARED_TILED_BENCH_ITERATIONS 100000

typedef struct matrix_mul_shared_tiled_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} matrix_mul_shared_tiled_bench_metrics_t;
