/**
 * Microbenchmark harness and cycle latency profiling for Warp-Level Shuffle Reduction and Ballot Tree.
 * Module: warp_reduce_sum
 */

#ifndef BENCH_WARP_REDUCE_SUM_H
#define BENCH_WARP_REDUCE_SUM_H

#include <stdint.h>

#define BENCH_WARMUP_ITERATIONS 1000
#define BENCH_SAMPLE_ITERATIONS 100000

typedef struct warp_reduce_sum_bench_metrics {
    uint64_t total_cycles;
    uint64_t elapsed_nanoseconds;
    double throughput_elements_per_sec;
} warp_reduce_sum_bench_metrics_t;

#endif /* BENCH_WARP_REDUCE_SUM_H */
