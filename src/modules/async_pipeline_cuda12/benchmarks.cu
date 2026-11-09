/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Asynchronous Memory Copy Pipeline with Streams.
 * Module: async_pipeline_cuda12
 */

#include <stdint.h>

#define ASYNC_PIPELINE_CUDA12_BENCH_SAMPLES 100000

typedef struct async_pipeline_cuda12_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} async_pipeline_cuda12_bench_stats_t;
