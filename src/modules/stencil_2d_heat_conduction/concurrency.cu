/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct stencil_2d_heat_conduction_sync_state {
    volatile uint64_t counter;
    volatile uint32_t concurrency_count;
} stencil_2d_heat_conduction_sync_state_t;

static inline void stencil_2d_heat_conduction_sync_increment(stencil_2d_heat_conduction_sync_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELEASE);
}
