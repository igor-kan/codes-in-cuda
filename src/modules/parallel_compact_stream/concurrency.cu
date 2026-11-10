/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Stream Compaction and Filtering via Parallel Scan.
 * Module: parallel_compact_stream
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct parallel_compact_stream_sync_counter {
    volatile uint64_t count;
} parallel_compact_stream_sync_counter_t;

static inline void parallel_compact_stream_sync_inc(parallel_compact_stream_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
