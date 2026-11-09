/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Asynchronous Memory Copy Pipeline with Streams.
 * Module: async_pipeline_cuda12
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct async_pipeline_cuda12_sync_counter {
    volatile uint64_t count;
} async_pipeline_cuda12_sync_counter_t;

static inline void async_pipeline_cuda12_sync_inc(async_pipeline_cuda12_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
