/**
 * @file interface.cu
 * @brief Abstract contracts and prototypes for GPU Fast K-th Selection via Radix Partitioning.
 * Module: parallel_radix_select
 */

#ifndef PARALLEL_RADIX_SELECT_INTERFACE_H
#define PARALLEL_RADIX_SELECT_INTERFACE_H

#include "types.cu"

typedef int (*parallel_radix_select_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct parallel_radix_select_vtable {
    int (*init)(parallel_radix_select_state_t* state, const parallel_radix_select_config_t* cfg);
    int (*execute)(parallel_radix_select_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*destroy)(parallel_radix_select_state_t* state);
} parallel_radix_select_vtable_t;

#endif /* PARALLEL_RADIX_SELECT_INTERFACE_H */
