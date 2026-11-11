/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for ELLPACK Sparse Matrix-Vector Multiplication Kernel.
 * Module: sparse_ell_spmv_cuda
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct sparse_ell_spmv_cuda_sync_counter {
    volatile uint64_t count;
} sparse_ell_spmv_cuda_sync_counter_t;

static inline void sparse_ell_spmv_cuda_sync_inc_v47(sparse_ell_spmv_cuda_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
