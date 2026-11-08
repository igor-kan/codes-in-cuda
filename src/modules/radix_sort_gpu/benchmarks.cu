/**
 * Microbenchmark harness and cycle latency profiling for GPU Multi-Pass Bitwise Parallel Radix Sort.
 * Module: radix_sort_gpu
 */

#ifndef BENCH_RADIX_SORT_GPU_H
#define BENCH_RADIX_SORT_GPU_H

#include <stdint.h>

#define BENCH_WARMUP_ITERATIONS 1000
#define BENCH_SAMPLE_ITERATIONS 100000

typedef struct radix_sort_gpu_bench_metrics {
    uint64_t total_cycles;
    uint64_t elapsed_nanoseconds;
    double throughput_elements_per_sec;
} radix_sort_gpu_bench_metrics_t;

#endif /* BENCH_RADIX_SORT_GPU_H */
