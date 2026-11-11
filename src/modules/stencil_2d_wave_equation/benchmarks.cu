/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for 2D Acoustic Wave Propagation Stencil with Shared Halo.
 * Module: stencil_2d_wave_equation
 */

#include <stdint.h>

#define STENCIL_2D_WAVE_EQUATION_BENCH_SAMPLES 100000

typedef struct stencil_2d_wave_equation_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} stencil_2d_wave_equation_bench_stats_t;
