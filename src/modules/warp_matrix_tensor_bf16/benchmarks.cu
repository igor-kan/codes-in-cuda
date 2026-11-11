/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline.
 * Module: warp_matrix_tensor_bf16
 */

#include <stdint.h>

#define WARP_MATRIX_TENSOR_BF16_BENCH_SAMPLES 100000

typedef struct warp_matrix_tensor_bf16_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} warp_matrix_tensor_bf16_bench_stats_t;
