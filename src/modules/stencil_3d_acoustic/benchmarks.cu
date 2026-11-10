/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for 3D 25-Point High-Order Acoustic Wave Stencil.
 * Module: stencil_3d_acoustic
 */

#include <stdint.h>

#define STENCIL_3D_ACOUSTIC_BENCH_SAMPLES 100000

typedef struct stencil_3d_acoustic_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} stencil_3d_acoustic_bench_stats_t;
