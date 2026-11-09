/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Batched Small-Matrix Cholesky Decomposition.
 * Module: batched_cholesky_cuda
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct batched_cholesky_cuda_sync_counter {
    volatile uint64_t count;
} batched_cholesky_cuda_sync_counter_t;

static inline void batched_cholesky_cuda_sync_inc(batched_cholesky_cuda_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
