/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#include <stdint.h>

#define CONV2D_IM2COL_GEMM_BENCH_ITERATIONS 100000

typedef struct conv2d_im2col_gemm_bench_result {
    uint64_t total_cycles;
    double throughput_ops_sec;
} conv2d_im2col_gemm_bench_result_t;
