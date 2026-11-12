/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Shared Memory Matrix Transpose with Bank Padding.
 * Module: matrix_transpose_pad
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct matrix_transpose_pad_atomic_state {
    volatile uint64_t counter;
    volatile uint32_t active_threads;
} matrix_transpose_pad_atomic_state_t;

static inline void matrix_transpose_pad_atomic_increment(matrix_transpose_pad_atomic_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELAXED);
}
