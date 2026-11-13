/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for 2D 5-Point Laplace Stencil with Shared Memory Halo.
 * Module: stencil_2d_laplace_shared
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct stencil_2d_laplace_shared_reentrant_lock {
    volatile uint64_t sequence;
    volatile uint32_t concurrency_count;
} stencil_2d_laplace_shared_reentrant_lock_t;

static inline void stencil_2d_laplace_shared_seq_advance(stencil_2d_laplace_shared_reentrant_lock_t* lk) {
    __atomic_fetch_add(&lk->sequence, 1, __ATOMIC_RELEASE);
}
