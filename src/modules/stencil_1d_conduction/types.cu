/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction | Algorithm Family: stencil_1d
 */

#ifndef STENCIL_1D_CONDUCTION_TYPES_H
#define STENCIL_1D_CONDUCTION_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define STENCIL_1D_CONDUCTION_ALIGNMENT 64
#define STENCIL_1D_CONDUCTION_BASE_CAPACITY 1024

typedef struct stencil_1d_conduction_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} stencil_1d_conduction_config_t;

typedef struct stencil_1d_conduction_state {
    void* buffer;
    size_t count;
    uint64_t operations;
    double accumulator;
    stencil_1d_conduction_config_t config;
} stencil_1d_conduction_state_t;

#endif /* STENCIL_1D_CONDUCTION_TYPES_H */
