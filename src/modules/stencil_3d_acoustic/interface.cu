/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for 3D 25-Point High-Order Acoustic Wave Stencil.
 * Module: stencil_3d_acoustic
 */

#ifndef STENCIL_3D_ACOUSTIC_INTERFACE_H
#define STENCIL_3D_ACOUSTIC_INTERFACE_H

#include "types.cu"

typedef int (*stencil_3d_acoustic_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct stencil_3d_acoustic_vtable {
    int (*init)(stencil_3d_acoustic_state_t* state, const stencil_3d_acoustic_config_t* cfg);
    int (*execute)(stencil_3d_acoustic_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(stencil_3d_acoustic_state_t* state);
    int (*destroy)(stencil_3d_acoustic_state_t* state);
} stencil_3d_acoustic_vtable_t;

#endif /* STENCIL_3D_ACOUSTIC_INTERFACE_H */
