/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele | Algorithm Family: prefix_scan
 */

#ifndef PREFIX_SUM_HILLIS_STEELE_INTERFACE_H
#define PREFIX_SUM_HILLIS_STEELE_INTERFACE_H

#include "types.cu"

typedef int (*prefix_sum_hillis_steele_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct prefix_sum_hillis_steele_vtable {
    int (*init)(prefix_sum_hillis_steele_state_t* state, const prefix_sum_hillis_steele_config_t* cfg);
    int (*execute)(prefix_sum_hillis_steele_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(prefix_sum_hillis_steele_state_t* state);
    int (*destroy)(prefix_sum_hillis_steele_state_t* state);
} prefix_sum_hillis_steele_vtable_t;

#endif /* PREFIX_SUM_HILLIS_STEELE_INTERFACE_H */
