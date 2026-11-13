/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Warp Ballot Voting and Shuffle-Down Tree Reduction.
 * Module: warp_divergence_reduction | Algorithm Family: warp_reduction
 */

#ifndef WARP_DIVERGENCE_REDUCTION_INTERFACE_H
#define WARP_DIVERGENCE_REDUCTION_INTERFACE_H

#include "types.cu"

typedef int (*warp_divergence_reduction_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct warp_divergence_reduction_vtable {
    int (*init)(warp_divergence_reduction_state_t* state, const warp_divergence_reduction_config_t* cfg);
    int (*execute)(warp_divergence_reduction_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(warp_divergence_reduction_state_t* state);
    int (*destroy)(warp_divergence_reduction_state_t* state);
} warp_divergence_reduction_vtable_t;

#endif /* WARP_DIVERGENCE_REDUCTION_INTERFACE_H */
