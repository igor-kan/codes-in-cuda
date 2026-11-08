/**
 * Microbenchmark harness and cycle latency profiling for Tensor Core WMMA Mixed-Precision GEMM Acceleration.
 * Module: batch_gemm_wmma
 */

#ifndef BENCH_BATCH_GEMM_WMMA_H
#define BENCH_BATCH_GEMM_WMMA_H

#include <stdint.h>

#define BENCH_WARMUP_ITERATIONS 1000
#define BENCH_SAMPLE_ITERATIONS 100000

typedef struct batch_gemm_wmma_bench_metrics {
    uint64_t total_cycles;
    uint64_t elapsed_nanoseconds;
    double throughput_elements_per_sec;
} batch_gemm_wmma_bench_metrics_t;

#endif /* BENCH_BATCH_GEMM_WMMA_H */
