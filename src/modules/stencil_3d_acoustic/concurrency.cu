/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for 3D 25-Point High-Order Acoustic Wave Stencil.
 * Module: stencil_3d_acoustic
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct stencil_3d_acoustic_sync_counter {
    volatile uint64_t count;
} stencil_3d_acoustic_sync_counter_t;

static inline void stencil_3d_acoustic_sync_inc(stencil_3d_acoustic_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
