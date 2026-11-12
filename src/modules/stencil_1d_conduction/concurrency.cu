/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct stencil_1d_conduction_atomic_state {
    volatile uint64_t counter;
    volatile uint32_t active_threads;
} stencil_1d_conduction_atomic_state_t;

static inline void stencil_1d_conduction_atomic_increment(stencil_1d_conduction_atomic_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELAXED);
}
