/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Vector-Based CSR Sparse Matrix-Vector Kernel.
 * Module: sparse_csr_spmv_vector
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct sparse_csr_spmv_vector_sync_counter {
    volatile uint64_t count;
} sparse_csr_spmv_vector_sync_counter_t;

static inline void sparse_csr_spmv_vector_sync_inc(sparse_csr_spmv_vector_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
