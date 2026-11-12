/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Warp-Per-Row Dense Matrix-Vector Multiplication.
 * Module: dense_gemv_warp
 */

#include <stdint.h>

#define DENSE_GEMV_WARP_BENCH_CYCLES 100000

typedef struct dense_gemv_warp_profile_results {
    uint64_t start_tsc;
    uint64_t end_tsc;
    double ops_per_second;
} dense_gemv_warp_profile_results_t;
