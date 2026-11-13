/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

#include <stdint.h>

#define PREFIX_SUM_HILLIS_STEELE_BENCH_ITERATIONS 100000

typedef struct prefix_sum_hillis_steele_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} prefix_sum_hillis_steele_bench_metrics_t;
