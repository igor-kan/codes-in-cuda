/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Grid-Wide Cooperative Barrier Synchronization.
 * Module: cooperative_groups_grid
 */

#include <stdint.h>

#define COOPERATIVE_GROUPS_GRID_BENCH_SAMPLES 100000

typedef struct cooperative_groups_grid_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} cooperative_groups_grid_bench_stats_t;
