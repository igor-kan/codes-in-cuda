/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for 3D 7-Point Laplacian Stencil with Shared Memory.
 * Module: stencil_3d_laplacian
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct stencil_3d_laplacian_sync_counter {
    volatile uint64_t count;
} stencil_3d_laplacian_sync_counter_t;

static inline void stencil_3d_laplacian_sync_inc(stencil_3d_laplacian_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
