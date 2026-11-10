/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct warp_matrix_gemm_fp16_sync_counter {
    volatile uint64_t count;
} warp_matrix_gemm_fp16_sync_counter_t;

static inline void warp_matrix_gemm_fp16_sync_inc(warp_matrix_gemm_fp16_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
