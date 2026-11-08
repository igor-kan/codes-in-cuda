/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Shared-Memory GPU Bitonic Sorting Network.
 * Module: bitonic_sort_gpu
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct bitonic_sort_gpu_atomic_counter {
    volatile uint64_t value;
} bitonic_sort_gpu_atomic_counter_t;

static inline void bitonic_sort_gpu_counter_inc(bitonic_sort_gpu_atomic_counter_t* c) {
    __atomic_fetch_add(&c->value, 1, __ATOMIC_RELAXED);
}
