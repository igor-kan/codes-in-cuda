/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline.
 * Module: warp_matrix_tensor_bf16
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct warp_matrix_tensor_bf16_sync_counter {
    volatile uint64_t count;
} warp_matrix_tensor_bf16_sync_counter_t;

static inline void warp_matrix_tensor_bf16_sync_inc_v47(warp_matrix_tensor_bf16_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
