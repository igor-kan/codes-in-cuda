/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for GPU Segmented Work-Efficient Prefix Scan.
 * Module: segmented_scan_gpu
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct segmented_scan_gpu_atomic_counter {
    volatile uint64_t value;
} segmented_scan_gpu_atomic_counter_t;

static inline void segmented_scan_gpu_counter_inc(segmented_scan_gpu_atomic_counter_t* c) {
    __atomic_fetch_add(&c->value, 1, __ATOMIC_RELAXED);
}
