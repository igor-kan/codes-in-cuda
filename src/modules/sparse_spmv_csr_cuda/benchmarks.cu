/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#include <stdint.h>

#define SPARSE_SPMV_CSR_CUDA_BENCH_ITERATIONS 100000

typedef struct sparse_spmv_csr_cuda_bench_result {
    uint64_t total_cycles;
    double throughput_ops_sec;
} sparse_spmv_csr_cuda_bench_result_t;
