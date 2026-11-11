/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for CUDA Stream-Ordered Memory Allocator Pipeline.
 * Module: stream_ordered_memory_alloc
 */

#include <stdint.h>

#define STREAM_ORDERED_MEMORY_ALLOC_BENCH_SAMPLES 100000

typedef struct stream_ordered_memory_alloc_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} stream_ordered_memory_alloc_bench_stats_t;
