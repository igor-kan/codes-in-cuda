/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

#include <stdint.h>

#define WARP_REDUCE_ANY_ALL_BENCH_ITERATIONS 100000

typedef struct warp_reduce_any_all_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} warp_reduce_any_all_bench_metrics_t;
