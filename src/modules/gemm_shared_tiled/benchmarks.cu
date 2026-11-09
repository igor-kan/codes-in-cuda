/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for 2D Block-Tiled Matrix GEMM with Double-Buffering.
 * Module: gemm_shared_tiled
 */

#include <stdint.h>

#define GEMM_SHARED_TILED_BENCH_SAMPLES 100000

typedef struct gemm_shared_tiled_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} gemm_shared_tiled_bench_stats_t;
