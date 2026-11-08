/**
 * Microbenchmark harness and cycle latency profiling for Block-Level Reduction with Atomic Accumulator.
 * Module: vector_dot_product_atomic
 */

#ifndef BENCH_VECTOR_DOT_PRODUCT_ATOMIC_H
#define BENCH_VECTOR_DOT_PRODUCT_ATOMIC_H

#include <stdint.h>

#define BENCH_WARMUP_ITERATIONS 1000
#define BENCH_SAMPLE_ITERATIONS 100000

typedef struct vector_dot_product_atomic_bench_metrics {
    uint64_t total_cycles;
    uint64_t elapsed_nanoseconds;
    double throughput_elements_per_sec;
} vector_dot_product_atomic_bench_metrics_t;

#endif /* BENCH_VECTOR_DOT_PRODUCT_ATOMIC_H */
