/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct vector_norm2_atomic_atomic_state {
    volatile uint64_t counter;
    volatile uint32_t active_threads;
} vector_norm2_atomic_atomic_state_t;

static inline void vector_norm2_atomic_atomic_increment(vector_norm2_atomic_atomic_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELAXED);
}
