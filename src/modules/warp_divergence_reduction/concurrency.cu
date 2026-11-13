/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Warp Ballot Voting and Shuffle-Down Tree Reduction.
 * Module: warp_divergence_reduction
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct warp_divergence_reduction_reentrant_lock {
    volatile uint64_t sequence;
    volatile uint32_t concurrency_count;
} warp_divergence_reduction_reentrant_lock_t;

static inline void warp_divergence_reduction_seq_advance(warp_divergence_reduction_reentrant_lock_t* lk) {
    __atomic_fetch_add(&lk->sequence, 1, __ATOMIC_RELEASE);
}
