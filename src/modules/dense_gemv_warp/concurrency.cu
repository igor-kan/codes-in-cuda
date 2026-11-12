/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Warp-Per-Row Dense Matrix-Vector Multiplication.
 * Module: dense_gemv_warp
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct dense_gemv_warp_atomic_state {
    volatile uint64_t counter;
    volatile uint32_t active_threads;
} dense_gemv_warp_atomic_state_t;

static inline void dense_gemv_warp_atomic_increment(dense_gemv_warp_atomic_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELAXED);
}
