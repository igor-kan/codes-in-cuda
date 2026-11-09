/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Sparse Matrix Dense Matrix (SpMM) GPU Accelerator.
 * Module: sparse_spmm_csr_cuda
 */

#include <stdint.h>

#define SPARSE_SPMM_CSR_CUDA_BENCH_SAMPLES 100000

typedef struct sparse_spmm_csr_cuda_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} sparse_spmm_csr_cuda_bench_stats_t;
