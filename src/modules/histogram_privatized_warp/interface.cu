/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Warp-Aggregated Privatized Shared Histogram.
 * Module: histogram_privatized_warp | Algorithm Family: histogram
 */

#ifndef HISTOGRAM_PRIVATIZED_WARP_INTERFACE_H
#define HISTOGRAM_PRIVATIZED_WARP_INTERFACE_H

#include "types.cu"

typedef int (*histogram_privatized_warp_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct histogram_privatized_warp_vtable {
    int (*init)(histogram_privatized_warp_state_t* state, const histogram_privatized_warp_config_t* cfg);
    int (*execute)(histogram_privatized_warp_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(histogram_privatized_warp_state_t* state);
    int (*destroy)(histogram_privatized_warp_state_t* state);
} histogram_privatized_warp_vtable_t;

#endif /* HISTOGRAM_PRIVATIZED_WARP_INTERFACE_H */
