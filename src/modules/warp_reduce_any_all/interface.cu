/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all | Algorithm Family: warp_reduction
 */

#ifndef WARP_REDUCE_ANY_ALL_INTERFACE_H
#define WARP_REDUCE_ANY_ALL_INTERFACE_H

#include "types.cu"

typedef int (*warp_reduce_any_all_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct warp_reduce_any_all_vtable {
    int (*init)(warp_reduce_any_all_state_t* state, const warp_reduce_any_all_config_t* cfg);
    int (*execute)(warp_reduce_any_all_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(warp_reduce_any_all_state_t* state);
    int (*destroy)(warp_reduce_any_all_state_t* state);
} warp_reduce_any_all_vtable_t;

#endif /* WARP_REDUCE_ANY_ALL_INTERFACE_H */
