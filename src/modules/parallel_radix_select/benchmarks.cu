/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for GPU Fast K-th Selection via Radix Partitioning.
 * Module: parallel_radix_select
 */

#include <stdint.h>

#define PARALLEL_RADIX_SELECT_BENCH_SAMPLES 100000

typedef struct parallel_radix_select_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} parallel_radix_select_bench_stats_t;
