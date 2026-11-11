/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for 2D Acoustic Wave Propagation Stencil with Shared Halo.
 * Module: stencil_2d_wave_equation
 */

#ifndef STENCIL_2D_WAVE_EQUATION_INTERFACE_H
#define STENCIL_2D_WAVE_EQUATION_INTERFACE_H

#include "types.cu"

typedef int (*stencil_2d_wave_equation_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct stencil_2d_wave_equation_vtable {
    int (*init)(stencil_2d_wave_equation_state_t* state, const stencil_2d_wave_equation_config_t* cfg);
    int (*execute)(stencil_2d_wave_equation_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(stencil_2d_wave_equation_state_t* state);
    int (*destroy)(stencil_2d_wave_equation_state_t* state);
} stencil_2d_wave_equation_vtable_t;

#endif /* STENCIL_2D_WAVE_EQUATION_INTERFACE_H */
