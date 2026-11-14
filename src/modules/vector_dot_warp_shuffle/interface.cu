/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle | Algorithm Family: norm_reduce
 */

#ifndef VECTOR_DOT_WARP_SHUFFLE_INTERFACE_H
#define VECTOR_DOT_WARP_SHUFFLE_INTERFACE_H

#include "types.cu"

typedef int (*vector_dot_warp_shuffle_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct vector_dot_warp_shuffle_vtable {
    int (*init)(vector_dot_warp_shuffle_state_t* state, const vector_dot_warp_shuffle_config_t* cfg);
    int (*execute)(vector_dot_warp_shuffle_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(vector_dot_warp_shuffle_state_t* state);
    int (*destroy)(vector_dot_warp_shuffle_state_t* state);
} vector_dot_warp_shuffle_vtable_t;

#endif /* VECTOR_DOT_WARP_SHUFFLE_INTERFACE_H */
