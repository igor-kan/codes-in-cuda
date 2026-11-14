/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction
 */

#include <stdint.h>

#define STENCIL_2D_HEAT_CONDUCTION_BENCH_ITERATIONS 100000

typedef struct stencil_2d_heat_conduction_bench_metrics {
    uint64_t tsc_cycles;
    double ops_per_sec;
} stencil_2d_heat_conduction_bench_metrics_t;
