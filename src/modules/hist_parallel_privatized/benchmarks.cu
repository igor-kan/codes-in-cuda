/**
 * Microbenchmark harness and cycle latency profiling for Privatized Shared Memory Histogram with Min-Max.
 * Module: hist_parallel_privatized
 */

#ifndef BENCH_HIST_PARALLEL_PRIVATIZED_H
#define BENCH_HIST_PARALLEL_PRIVATIZED_H

#include <stdint.h>

#define BENCH_WARMUP_ITERATIONS 1000
#define BENCH_SAMPLE_ITERATIONS 100000

typedef struct hist_parallel_privatized_bench_metrics {
    uint64_t total_cycles;
    uint64_t elapsed_nanoseconds;
    double throughput_elements_per_sec;
} hist_parallel_privatized_bench_metrics_t;

#endif /* BENCH_HIST_PARALLEL_PRIVATIZED_H */
