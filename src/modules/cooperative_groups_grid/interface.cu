/**
 * @file interface.cu
 * @brief Abstract contracts and prototypes for Grid-Wide Cooperative Barrier Synchronization.
 * Module: cooperative_groups_grid
 */

#ifndef COOPERATIVE_GROUPS_GRID_INTERFACE_H
#define COOPERATIVE_GROUPS_GRID_INTERFACE_H

#include "types.cu"

typedef int (*cooperative_groups_grid_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct cooperative_groups_grid_vtable {
    int (*init)(cooperative_groups_grid_state_t* state, const cooperative_groups_grid_config_t* cfg);
    int (*execute)(cooperative_groups_grid_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*destroy)(cooperative_groups_grid_state_t* state);
} cooperative_groups_grid_vtable_t;

#endif /* COOPERATIVE_GROUPS_GRID_INTERFACE_H */
