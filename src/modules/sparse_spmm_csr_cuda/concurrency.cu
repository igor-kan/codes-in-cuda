/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Sparse Matrix Dense Matrix (SpMM) GPU Accelerator.
 * Module: sparse_spmm_csr_cuda
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct sparse_spmm_csr_cuda_sync_counter {
    volatile uint64_t count;
} sparse_spmm_csr_cuda_sync_counter_t;

static inline void sparse_spmm_csr_cuda_sync_inc(sparse_spmm_csr_cuda_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
