/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

#ifndef RADIX_SORT_ONESWEEP_INTERFACE_H
#define RADIX_SORT_ONESWEEP_INTERFACE_H

#include "types.cu"

typedef int (*radix_sort_onesweep_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct radix_sort_onesweep_vtable {
    int (*init)(radix_sort_onesweep_state_t* state, const radix_sort_onesweep_config_t* cfg);
    int (*execute)(radix_sort_onesweep_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(radix_sort_onesweep_state_t* state);
    int (*destroy)(radix_sort_onesweep_state_t* state);
} radix_sort_onesweep_vtable_t;

#endif /* RADIX_SORT_ONESWEEP_INTERFACE_H */
