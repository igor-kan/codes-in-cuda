/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for GPU Segmented Work-Efficient Prefix Scan.
 * Module: segmented_scan_gpu
 */

#include <stdint.h>

#define SEGMENTED_SCAN_GPU_BENCH_ITERATIONS 100000

typedef struct segmented_scan_gpu_bench_result {
    uint64_t total_cycles;
    double throughput_ops_sec;
} segmented_scan_gpu_bench_result_t;
