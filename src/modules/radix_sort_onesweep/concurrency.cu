/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct radix_sort_onesweep_sync_counter {
    volatile uint64_t count;
} radix_sort_onesweep_sync_counter_t;

static inline void radix_sort_onesweep_sync_inc(radix_sort_onesweep_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
