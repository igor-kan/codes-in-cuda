/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Warp-Synchronous Inclusive Prefix Scan via Shuffles.
 * Module: warp_shfl_scan | Algorithm Family: warp_scan
 */

#ifndef WARP_SHFL_SCAN_INTERFACE_H
#define WARP_SHFL_SCAN_INTERFACE_H

#include "types.cu"

typedef int (*warp_shfl_scan_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct warp_shfl_scan_vtable {
    int (*init)(warp_shfl_scan_state_t* state, const warp_shfl_scan_config_t* cfg);
    int (*execute)(warp_shfl_scan_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(warp_shfl_scan_state_t* state);
    int (*destroy)(warp_shfl_scan_state_t* state);
} warp_shfl_scan_vtable_t;

#endif /* WARP_SHFL_SCAN_INTERFACE_H */
