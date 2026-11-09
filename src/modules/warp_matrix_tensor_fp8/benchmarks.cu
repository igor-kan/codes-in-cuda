/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Tensor Core FP8/FP16 Mixed-Precision MMA Kernel.
 * Module: warp_matrix_tensor_fp8
 */

#include <stdint.h>

#define WARP_MATRIX_TENSOR_FP8_BENCH_SAMPLES 100000

typedef struct warp_matrix_tensor_fp8_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} warp_matrix_tensor_fp8_bench_stats_t;
