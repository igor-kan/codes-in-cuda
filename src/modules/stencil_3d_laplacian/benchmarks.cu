/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for 3D 7-Point Laplacian Stencil with Shared Memory.
 * Module: stencil_3d_laplacian
 */

#include <stdint.h>

#define STENCIL_3D_LAPLACIAN_BENCH_SAMPLES 100000

typedef struct stencil_3d_laplacian_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} stencil_3d_laplacian_bench_stats_t;
