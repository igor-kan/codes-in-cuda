/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Warp-Synchronous Inclusive Prefix Scan via Shuffles.
 * Module: warp_shfl_scan
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct warp_shfl_scan_atomic_state {
    volatile uint64_t counter;
    volatile uint32_t active_threads;
} warp_shfl_scan_atomic_state_t;

static inline void warp_shfl_scan_atomic_increment(warp_shfl_scan_atomic_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELAXED);
}
