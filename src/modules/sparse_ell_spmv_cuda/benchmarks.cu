/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for ELLPACK Sparse Matrix-Vector Multiplication Kernel.
 * Module: sparse_ell_spmv_cuda
 */

#include <stdint.h>

#define SPARSE_ELL_SPMV_CUDA_BENCH_SAMPLES 100000

typedef struct sparse_ell_spmv_cuda_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} sparse_ell_spmv_cuda_bench_stats_t;
