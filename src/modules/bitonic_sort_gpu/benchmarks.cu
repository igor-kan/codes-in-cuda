/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Shared-Memory GPU Bitonic Sorting Network.
 * Module: bitonic_sort_gpu
 */

#include <stdint.h>

#define BITONIC_SORT_GPU_BENCH_ITERATIONS 100000

typedef struct bitonic_sort_gpu_bench_result {
    uint64_t total_cycles;
    double throughput_ops_sec;
} bitonic_sort_gpu_bench_result_t;
