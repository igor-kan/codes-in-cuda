/**
 * @file interface.cu
 * @brief Abstract contracts and prototypes for Tensor Core FP8/FP16 Mixed-Precision MMA Kernel.
 * Module: warp_matrix_tensor_fp8
 */

#ifndef WARP_MATRIX_TENSOR_FP8_INTERFACE_H
#define WARP_MATRIX_TENSOR_FP8_INTERFACE_H

#include "types.cu"

typedef int (*warp_matrix_tensor_fp8_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct warp_matrix_tensor_fp8_vtable {
    int (*init)(warp_matrix_tensor_fp8_state_t* state, const warp_matrix_tensor_fp8_config_t* cfg);
    int (*execute)(warp_matrix_tensor_fp8_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*destroy)(warp_matrix_tensor_fp8_state_t* state);
} warp_matrix_tensor_fp8_vtable_t;

#endif /* WARP_MATRIX_TENSOR_FP8_INTERFACE_H */
