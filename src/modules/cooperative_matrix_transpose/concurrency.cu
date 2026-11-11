/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Grid Cooperative 2D Matrix Transpose with Bank Padding.
 * Module: cooperative_matrix_transpose
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct cooperative_matrix_transpose_sync_counter {
    volatile uint64_t count;
} cooperative_matrix_transpose_sync_counter_t;

static inline void cooperative_matrix_transpose_sync_inc_v47(cooperative_matrix_transpose_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
