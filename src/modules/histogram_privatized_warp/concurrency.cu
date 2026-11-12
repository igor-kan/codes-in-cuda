/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Warp-Aggregated Privatized Shared Histogram.
 * Module: histogram_privatized_warp
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct histogram_privatized_warp_atomic_state {
    volatile uint64_t counter;
    volatile uint32_t active_threads;
} histogram_privatized_warp_atomic_state_t;

static inline void histogram_privatized_warp_atomic_increment(histogram_privatized_warp_atomic_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELAXED);
}
