/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for CUDA Stream-Ordered Memory Allocator Pipeline.
 * Module: stream_ordered_memory_alloc
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct stream_ordered_memory_alloc_sync_counter {
    volatile uint64_t count;
} stream_ordered_memory_alloc_sync_counter_t;

static inline void stream_ordered_memory_alloc_sync_inc_v47(stream_ordered_memory_alloc_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
