/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Batched Small-Matrix LU Decomposition with Partial Pivoting.
 * Module: batched_lu_cuda
 */

#include <stdint.h>

#define BATCHED_LU_CUDA_BENCH_SAMPLES 100000

typedef struct batched_lu_cuda_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} batched_lu_cuda_bench_stats_t;
