/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for Grid-Wide Cooperative Barrier Synchronization.
 * Module: cooperative_groups_grid
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct cooperative_groups_grid_sync_counter {
    volatile uint64_t count;
} cooperative_groups_grid_sync_counter_t;

static inline void cooperative_groups_grid_sync_inc(cooperative_groups_grid_sync_counter_t* c) {
    __atomic_fetch_add(&c->count, 1, __ATOMIC_RELAXED);
}
