/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

#include <stdint.h>

#define WARP_MATRIX_GEMM_FP16_BENCH_SAMPLES 100000

typedef struct warp_matrix_gemm_fp16_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} warp_matrix_gemm_fp16_bench_stats_t;
