/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared | Algorithm Family: histogram
 */

#ifndef HISTOGRAM_ATOMIC_SHARED_INTERFACE_H
#define HISTOGRAM_ATOMIC_SHARED_INTERFACE_H

#include "types.cu"

typedef int (*histogram_atomic_shared_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct histogram_atomic_shared_vtable {
    int (*init)(histogram_atomic_shared_state_t* state, const histogram_atomic_shared_config_t* cfg);
    int (*execute)(histogram_atomic_shared_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(histogram_atomic_shared_state_t* state);
    int (*destroy)(histogram_atomic_shared_state_t* state);
} histogram_atomic_shared_vtable_t;

#endif /* HISTOGRAM_ATOMIC_SHARED_INTERFACE_H */
