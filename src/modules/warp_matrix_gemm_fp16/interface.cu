/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

#ifndef WARP_MATRIX_GEMM_FP16_INTERFACE_H
#define WARP_MATRIX_GEMM_FP16_INTERFACE_H

#include "types.cu"

typedef int (*warp_matrix_gemm_fp16_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct warp_matrix_gemm_fp16_vtable {
    int (*init)(warp_matrix_gemm_fp16_state_t* state, const warp_matrix_gemm_fp16_config_t* cfg);
    int (*execute)(warp_matrix_gemm_fp16_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(warp_matrix_gemm_fp16_state_t* state);
    int (*destroy)(warp_matrix_gemm_fp16_state_t* state);
} warp_matrix_gemm_fp16_vtable_t;

#endif /* WARP_MATRIX_GEMM_FP16_INTERFACE_H */
