/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Warp-Per-Row Dense Matrix-Vector Multiplication.
 * Module: dense_gemv_warp | Algorithm Family: gemv_warp
 */

#ifndef DENSE_GEMV_WARP_INTERFACE_H
#define DENSE_GEMV_WARP_INTERFACE_H

#include "types.cu"

typedef int (*dense_gemv_warp_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct dense_gemv_warp_vtable {
    int (*init)(dense_gemv_warp_state_t* state, const dense_gemv_warp_config_t* cfg);
    int (*execute)(dense_gemv_warp_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(dense_gemv_warp_state_t* state);
    int (*destroy)(dense_gemv_warp_state_t* state);
} dense_gemv_warp_vtable_t;

#endif /* DENSE_GEMV_WARP_INTERFACE_H */
