/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct dense_spmv_ellpack_cuda_sync_state {
    volatile uint64_t counter;
    volatile uint32_t concurrency_count;
} dense_spmv_ellpack_cuda_sync_state_t;

static inline void dense_spmv_ellpack_cuda_sync_increment(dense_spmv_ellpack_cuda_sync_state_t* s) {
    __atomic_fetch_add(&s->counter, 1, __ATOMIC_RELEASE);
}
