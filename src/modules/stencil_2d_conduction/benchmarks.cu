/**
 * Microbenchmark harness and cycle latency profiling for 9-Point Thermal Conduction Stencil with Shared Memory.
 * Module: stencil_2d_conduction
 */

#ifndef BENCH_STENCIL_2D_CONDUCTION_H
#define BENCH_STENCIL_2D_CONDUCTION_H

#include <stdint.h>

#define BENCH_WARMUP_ITERATIONS 1000
#define BENCH_SAMPLE_ITERATIONS 100000

typedef struct stencil_2d_conduction_bench_metrics {
    uint64_t total_cycles;
    uint64_t elapsed_nanoseconds;
    double throughput_elements_per_sec;
} stencil_2d_conduction_bench_metrics_t;

#endif /* BENCH_STENCIL_2D_CONDUCTION_H */
