/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for GPU Fast K-th Selection via Radix Partitioning.
 * Module: parallel_radix_select
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct parallel_radix_select_sync_counter {
    volatile uint64_t count;
} parallel_radix_select_sync_counter_t;

static inline void parallel_radix_select_sync_inc(parallel_radix_select_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
