/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic | Algorithm Family: norm_reduce
 */

#ifndef VECTOR_NORM2_ATOMIC_INTERFACE_H
#define VECTOR_NORM2_ATOMIC_INTERFACE_H

#include "types.cu"

typedef int (*vector_norm2_atomic_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct vector_norm2_atomic_vtable {
    int (*init)(vector_norm2_atomic_state_t* state, const vector_norm2_atomic_config_t* cfg);
    int (*execute)(vector_norm2_atomic_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(vector_norm2_atomic_state_t* state);
    int (*destroy)(vector_norm2_atomic_state_t* state);
} vector_norm2_atomic_vtable_t;

#endif /* VECTOR_NORM2_ATOMIC_INTERFACE_H */
