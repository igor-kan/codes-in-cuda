/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#ifndef CONV2D_IM2COL_GEMM_INTERFACE_H
#define CONV2D_IM2COL_GEMM_INTERFACE_H

#include "types.cu"

typedef int (*conv2d_im2col_gemm_transform_fn)(const double* in_data, double* out_data, size_t n);

typedef struct conv2d_im2col_gemm_interface {
    int (*init)(conv2d_im2col_gemm_state_t* state, const conv2d_im2col_gemm_config_t* cfg);
    int (*execute)(conv2d_im2col_gemm_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(conv2d_im2col_gemm_state_t* state);
    int (*destroy)(conv2d_im2col_gemm_state_t* state);
} conv2d_im2col_gemm_interface_t;

#endif /* CONV2D_IM2COL_GEMM_INTERFACE_H */
