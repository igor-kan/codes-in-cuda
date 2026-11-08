/**
 * Microbenchmark harness and cycle latency profiling for Work-Efficient Parallel Blelloch Prefix Scan.
 * Module: prefix_scan_blelloch
 */

#ifndef BENCH_PREFIX_SCAN_BLELLOCH_H
#define BENCH_PREFIX_SCAN_BLELLOCH_H

#include <stdint.h>

#define BENCH_WARMUP_ITERATIONS 1000
#define BENCH_SAMPLE_ITERATIONS 100000

typedef struct prefix_scan_blelloch_bench_metrics {
    uint64_t total_cycles;
    uint64_t elapsed_nanoseconds;
    double throughput_elements_per_sec;
} prefix_scan_blelloch_bench_metrics_t;

#endif /* BENCH_PREFIX_SCAN_BLELLOCH_H */
