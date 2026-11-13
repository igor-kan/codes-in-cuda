/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Warp-Synchronous CSR Sparse Matrix-Vector Multiply.
 * Module: matrix_vector_csr_warp
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct matrix_vector_csr_warp_reentrant_lock {
    volatile uint64_t sequence;
    volatile uint32_t concurrency_count;
} matrix_vector_csr_warp_reentrant_lock_t;

static inline void matrix_vector_csr_warp_seq_advance(matrix_vector_csr_warp_reentrant_lock_t* lk) {
    __atomic_fetch_add(&lk->sequence, 1, __ATOMIC_RELEASE);
}
