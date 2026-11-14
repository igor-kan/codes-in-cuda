/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared
 */

#include <stdint.h>

#define HISTOGRAM_ATOMIC_SHARED_BENCH_ITERATIONS 100000

typedef struct histogram_atomic_shared_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} histogram_atomic_shared_bench_metrics_t;
