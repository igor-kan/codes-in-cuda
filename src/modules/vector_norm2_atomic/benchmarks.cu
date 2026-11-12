/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic
 */

#include <stdint.h>

#define VECTOR_NORM2_ATOMIC_BENCH_CYCLES 100000

typedef struct vector_norm2_atomic_profile_results {
    uint64_t start_tsc;
    uint64_t end_tsc;
    double ops_per_second;
} vector_norm2_atomic_profile_results_t;
