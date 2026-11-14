/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda
 */

#include <stdint.h>

#define DENSE_SPMV_ELLPACK_CUDA_BENCH_ITERATIONS 100000

typedef struct dense_spmv_ellpack_cuda_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} dense_spmv_ellpack_cuda_bench_metrics_t;
