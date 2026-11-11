/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for GPU Segmented Parallel Reduction with Key Arrays.
 * Module: parallel_segmented_reduction
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct parallel_segmented_reduction_sync_counter {
    volatile uint64_t count;
} parallel_segmented_reduction_sync_counter_t;

static inline void parallel_segmented_reduction_sync_inc_v47(parallel_segmented_reduction_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
