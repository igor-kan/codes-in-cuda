/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction | Algorithm Family: stencil_shared
 */

#ifndef STENCIL_2D_HEAT_CONDUCTION_TYPES_H
#define STENCIL_2D_HEAT_CONDUCTION_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define STENCIL_2D_HEAT_CONDUCTION_ALIGNMENT 64
#define STENCIL_2D_HEAT_CONDUCTION_CAPACITY 4096

typedef struct stencil_2d_heat_conduction_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} stencil_2d_heat_conduction_config_t;

typedef struct stencil_2d_heat_conduction_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    stencil_2d_heat_conduction_config_t config;
} stencil_2d_heat_conduction_state_t;

#endif /* STENCIL_2D_HEAT_CONDUCTION_TYPES_H */
