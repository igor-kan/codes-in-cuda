/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for 2D 5-Point Laplace Stencil with Shared Memory Halo.
 * Module: stencil_2d_laplace_shared
 */

#include <stdint.h>

#define STENCIL_2D_LAPLACE_SHARED_BENCH_ITERATIONS 100000

typedef struct stencil_2d_laplace_shared_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} stencil_2d_laplace_shared_bench_metrics_t;
