/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct vector_dot_warp_shuffle_sync_state {
    volatile uint64_t counter;
    volatile uint32_t concurrency_count;
} vector_dot_warp_shuffle_sync_state_t;

static inline void vector_dot_warp_shuffle_sync_increment(vector_dot_warp_shuffle_sync_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELEASE);
}
