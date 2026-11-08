/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

#include <stdint.h>

#define PARALLEL_REDUCTION_SHFL_BENCH_ITERATIONS 100000

typedef struct parallel_reduction_shfl_bench_result {
    uint64_t total_cycles;
    double throughput_ops_sec;
} parallel_reduction_shfl_bench_result_t;
