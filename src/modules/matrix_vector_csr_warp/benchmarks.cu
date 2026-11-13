/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Warp-Synchronous CSR Sparse Matrix-Vector Multiply.
 * Module: matrix_vector_csr_warp
 */

#include <stdint.h>

#define MATRIX_VECTOR_CSR_WARP_BENCH_ITERATIONS 100000

typedef struct matrix_vector_csr_warp_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} matrix_vector_csr_warp_bench_metrics_t;
