/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Vector-Based CSR Sparse Matrix-Vector Kernel.
 * Module: sparse_csr_spmv_vector
 */

#include <stdint.h>

#define SPARSE_CSR_SPMV_VECTOR_BENCH_SAMPLES 100000

typedef struct sparse_csr_spmv_vector_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} sparse_csr_spmv_vector_bench_stats_t;
