/**
 * @file concurrency.cu
 * @brief Thread-safe reentrancy and atomic state primitives for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct prefix_sum_hillis_steele_reentrant_lock {
    volatile uint64_t sequence;
    volatile uint32_t concurrency_count;
} prefix_sum_hillis_steele_reentrant_lock_t;

static inline void prefix_sum_hillis_steele_seq_advance(prefix_sum_hillis_steele_reentrant_lock_t* lk) {
    __atomic_fetch_add(&lk->sequence, 1, __ATOMIC_RELEASE);
}
