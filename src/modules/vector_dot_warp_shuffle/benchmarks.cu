/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle
 */

#include <stdint.h>

#define VECTOR_DOT_WARP_SHUFFLE_BENCH_ITERATIONS 100000

typedef struct vector_dot_warp_shuffle_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} vector_dot_warp_shuffle_bench_metrics_t;
