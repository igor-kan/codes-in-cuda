/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct histogram_atomic_shared_sync_state {
    volatile uint64_t counter;
    volatile uint32_t concurrency_count;
} histogram_atomic_shared_sync_state_t;

static inline void histogram_atomic_shared_sync_increment(histogram_atomic_shared_sync_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELEASE);
}
