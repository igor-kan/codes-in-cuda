/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for 2D Acoustic Wave Propagation Stencil with Shared Halo.
 * Module: stencil_2d_wave_equation
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct stencil_2d_wave_equation_sync_counter {
    volatile uint64_t count;
} stencil_2d_wave_equation_sync_counter_t;

static inline void stencil_2d_wave_equation_sync_inc_v47(stencil_2d_wave_equation_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
