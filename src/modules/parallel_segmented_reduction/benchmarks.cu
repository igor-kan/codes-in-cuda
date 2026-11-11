/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for GPU Segmented Parallel Reduction with Key Arrays.
 * Module: parallel_segmented_reduction
 */

#include <stdint.h>

#define PARALLEL_SEGMENTED_REDUCTION_BENCH_SAMPLES 100000

typedef struct parallel_segmented_reduction_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} parallel_segmented_reduction_bench_stats_t;
