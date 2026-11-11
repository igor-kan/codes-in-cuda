/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Batched Small-Matrix LU Decomposition with Partial Pivoting.
 * Module: batched_lu_cuda
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct batched_lu_cuda_sync_counter {
    volatile uint64_t count;
} batched_lu_cuda_sync_counter_t;

static inline void batched_lu_cuda_sync_inc_v47(batched_lu_cuda_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
