/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct parallel_reduction_shfl_atomic_counter {
    volatile uint64_t value;
} parallel_reduction_shfl_atomic_counter_t;

static inline void parallel_reduction_shfl_counter_inc(parallel_reduction_shfl_atomic_counter_t* c) {
    __atomic_fetch_add(&c->value, 1, __ATOMIC_RELAXED);
}
