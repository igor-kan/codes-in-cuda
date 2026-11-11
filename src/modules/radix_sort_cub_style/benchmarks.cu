/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for CUB-Style Parallel Block Radix Sort with Warp Shuffles.
 * Module: radix_sort_cub_style
 */

#include <stdint.h>

#define RADIX_SORT_CUB_STYLE_BENCH_SAMPLES 100000

typedef struct radix_sort_cub_style_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} radix_sort_cub_style_bench_stats_t;
