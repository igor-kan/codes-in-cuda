/**
 * @file interface.cu
 * @brief Abstract contracts and prototypes for 3D 7-Point Laplacian Stencil with Shared Memory.
 * Module: stencil_3d_laplacian
 */

#ifndef STENCIL_3D_LAPLACIAN_INTERFACE_H
#define STENCIL_3D_LAPLACIAN_INTERFACE_H

#include "types.cu"

typedef int (*stencil_3d_laplacian_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct stencil_3d_laplacian_vtable {
    int (*init)(stencil_3d_laplacian_state_t* state, const stencil_3d_laplacian_config_t* cfg);
    int (*execute)(stencil_3d_laplacian_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*destroy)(stencil_3d_laplacian_state_t* state);
} stencil_3d_laplacian_vtable_t;

#endif /* STENCIL_3D_LAPLACIAN_INTERFACE_H */
