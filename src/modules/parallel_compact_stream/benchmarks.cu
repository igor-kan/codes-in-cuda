/**
 * @file benchmarks.cu
 * @brief Microbenchmark harness and cycle timing for Stream Compaction and Filtering via Parallel Scan.
 * Module: parallel_compact_stream
 */

#include <stdint.h>

#define PARALLEL_COMPACT_STREAM_BENCH_SAMPLES 100000

typedef struct parallel_compact_stream_bench_stats {
    uint64_t cycles;
    double throughput_ops_sec;
} parallel_compact_stream_bench_stats_t;
