/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for 2D Block-Tiled Matrix GEMM with Double-Buffering.
 * Module: gemm_shared_tiled
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct gemm_shared_tiled_sync_counter {
    volatile uint64_t count;
} gemm_shared_tiled_sync_counter_t;

static inline void gemm_shared_tiled_sync_inc(gemm_shared_tiled_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
