/**
 * @file types.cu
 * @brief Core types and configuration for Grid-Wide Cooperative Barrier Synchronization.
 * Module: cooperative_groups_grid
 */

#ifndef COOPERATIVE_GROUPS_GRID_TYPES_H
#define COOPERATIVE_GROUPS_GRID_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define COOPERATIVE_GROUPS_GRID_ALIGNMENT 64
#define COOPERATIVE_GROUPS_GRID_CAPACITY 2048

typedef struct cooperative_groups_grid_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} cooperative_groups_grid_config_t;

typedef struct cooperative_groups_grid_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    cooperative_groups_grid_config_t config;
} cooperative_groups_grid_state_t;

#endif /* COOPERATIVE_GROUPS_GRID_TYPES_H */
