/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for CUB-Style Parallel Block Radix Sort with Warp Shuffles.
 * Module: radix_sort_cub_style
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct radix_sort_cub_style_sync_counter {
    volatile uint64_t count;
} radix_sort_cub_style_sync_counter_t;

static inline void radix_sort_cub_style_sync_inc_v47(radix_sort_cub_style_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
