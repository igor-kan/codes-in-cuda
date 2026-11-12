/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Warp-Synchronous Inclusive Prefix Scan via Shuffles.
 * Module: warp_shfl_scan
 */

#include <stdint.h>

#define WARP_SHFL_SCAN_BENCH_CYCLES 100000

typedef struct warp_shfl_scan_profile_results {
    uint64_t start_tsc;
    uint64_t end_tsc;
    double ops_per_second;
} warp_shfl_scan_profile_results_t;
