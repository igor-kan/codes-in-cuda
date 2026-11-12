/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and latency profiling for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction
 */

#include <stdint.h>

#define STENCIL_1D_CONDUCTION_BENCH_CYCLES 100000

typedef struct stencil_1d_conduction_profile_results {
    uint64_t start_tsc;
    uint64_t end_tsc;
    double ops_per_second;
} stencil_1d_conduction_profile_results_t;
