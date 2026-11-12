/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Warp-Aggregated Privatized Shared Histogram.
 * Module: histogram_privatized_warp
 */

#include <stdint.h>

#define HISTOGRAM_PRIVATIZED_WARP_BENCH_CYCLES 100000

typedef struct histogram_privatized_warp_profile_results {
    uint64_t start_tsc;
    uint64_t end_tsc;
    double ops_per_second;
} histogram_privatized_warp_profile_results_t;
