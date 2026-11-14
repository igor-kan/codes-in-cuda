/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for 2D Shared-Memory Tiled Matrix Multiplication Kernel.
 * Module: matrix_mul_shared_tiled
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct matrix_mul_shared_tiled_sync_state {
    volatile uint64_t counter;
    volatile uint32_t concurrency_count;
} matrix_mul_shared_tiled_sync_state_t;

static inline void matrix_mul_shared_tiled_sync_increment(matrix_mul_shared_tiled_sync_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELEASE);
}
