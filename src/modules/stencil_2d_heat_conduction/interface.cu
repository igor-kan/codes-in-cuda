/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction | Algorithm Family: stencil_shared
 */

#ifndef STENCIL_2D_HEAT_CONDUCTION_INTERFACE_H
#define STENCIL_2D_HEAT_CONDUCTION_INTERFACE_H

#include "types.cu"

typedef int (*stencil_2d_heat_conduction_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct stencil_2d_heat_conduction_vtable {
    int (*init)(stencil_2d_heat_conduction_state_t* state, const stencil_2d_heat_conduction_config_t* cfg);
    int (*execute)(stencil_2d_heat_conduction_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(stencil_2d_heat_conduction_state_t* state);
    int (*destroy)(stencil_2d_heat_conduction_state_t* state);
} stencil_2d_heat_conduction_vtable_t;

#endif /* STENCIL_2D_HEAT_CONDUCTION_INTERFACE_H */
