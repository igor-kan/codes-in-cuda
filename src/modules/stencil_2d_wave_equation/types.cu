/**
 * @file types.cu
 * @brief Core types and configuration for 2D Acoustic Wave Propagation Stencil with Shared Halo.
 * Module: stencil_2d_wave_equation
 */

#ifndef STENCIL_2D_WAVE_EQUATION_TYPES_H
#define STENCIL_2D_WAVE_EQUATION_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define STENCIL_2D_WAVE_EQUATION_ALIGNMENT 64
#define STENCIL_2D_WAVE_EQUATION_DEFAULT_SZ 8192

typedef struct stencil_2d_wave_equation_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} stencil_2d_wave_equation_config_t;

typedef struct stencil_2d_wave_equation_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    stencil_2d_wave_equation_config_t config;
} stencil_2d_wave_equation_state_t;

#endif /* STENCIL_2D_WAVE_EQUATION_TYPES_H */
