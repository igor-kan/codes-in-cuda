/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Warp Ballot Voting and Shuffle-Down Tree Reduction.
 * Module: warp_divergence_reduction
 */

#include <stdint.h>

#define WARP_DIVERGENCE_REDUCTION_BENCH_ITERATIONS 100000

typedef struct warp_divergence_reduction_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} warp_divergence_reduction_bench_metrics_t;
