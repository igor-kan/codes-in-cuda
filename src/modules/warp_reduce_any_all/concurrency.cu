/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct warp_reduce_any_all_sync_state {
    volatile uint64_t counter;
    volatile uint32_t concurrency_count;
} warp_reduce_any_all_sync_state_t;

static inline void warp_reduce_any_all_sync_increment(warp_reduce_any_all_sync_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELEASE);
}
