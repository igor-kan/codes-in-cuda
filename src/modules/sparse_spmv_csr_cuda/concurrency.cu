/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct sparse_spmv_csr_cuda_atomic_counter {
    volatile uint64_t value;
} sparse_spmv_csr_cuda_atomic_counter_t;

static inline void sparse_spmv_csr_cuda_counter_inc(sparse_spmv_csr_cuda_atomic_counter_t* c) {
    __atomic_fetch_add(&c->value, 1, __ATOMIC_RELAXED);
}
