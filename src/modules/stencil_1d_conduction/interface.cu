/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction | Algorithm Family: stencil_1d
 */

#ifndef STENCIL_1D_CONDUCTION_INTERFACE_H
#define STENCIL_1D_CONDUCTION_INTERFACE_H

#include "types.cu"

typedef int (*stencil_1d_conduction_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct stencil_1d_conduction_vtable {
    int (*init)(stencil_1d_conduction_state_t* state, const stencil_1d_conduction_config_t* cfg);
    int (*execute)(stencil_1d_conduction_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(stencil_1d_conduction_state_t* state);
    int (*destroy)(stencil_1d_conduction_state_t* state);
} stencil_1d_conduction_vtable_t;

#endif /* STENCIL_1D_CONDUCTION_INTERFACE_H */
