/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

#include <stdint.h>

#define RADIX_SORT_ONESWEEP_BENCH_SAMPLES 100000

typedef struct radix_sort_onesweep_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} radix_sort_onesweep_bench_stats_t;
