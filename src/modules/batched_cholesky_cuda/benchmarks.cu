/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Batched Small-Matrix Cholesky Decomposition.
 * Module: batched_cholesky_cuda
 */

#include <stdint.h>

#define BATCHED_CHOLESKY_CUDA_BENCH_SAMPLES 100000

typedef struct batched_cholesky_cuda_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} batched_cholesky_cuda_bench_stats_t;
