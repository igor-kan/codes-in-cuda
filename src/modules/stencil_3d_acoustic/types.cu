/**
 * @file types.cu
 * @brief Core types and configuration for 3D 25-Point High-Order Acoustic Wave Stencil.
 * Module: stencil_3d_acoustic
 */

#ifndef STENCIL_3D_ACOUSTIC_TYPES_H
#define STENCIL_3D_ACOUSTIC_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define STENCIL_3D_ACOUSTIC_ALIGNMENT 64
#define STENCIL_3D_ACOUSTIC_CAPACITY 4096

typedef struct stencil_3d_acoustic_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} stencil_3d_acoustic_config_t;

typedef struct stencil_3d_acoustic_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    stencil_3d_acoustic_config_t config;
} stencil_3d_acoustic_state_t;

#endif /* STENCIL_3D_ACOUSTIC_TYPES_H */
