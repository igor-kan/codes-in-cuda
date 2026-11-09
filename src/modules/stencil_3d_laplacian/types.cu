/**
 * @file types.cu
 * @brief Core types and configuration for 3D 7-Point Laplacian Stencil with Shared Memory.
 * Module: stencil_3d_laplacian
 */

#ifndef STENCIL_3D_LAPLACIAN_TYPES_H
#define STENCIL_3D_LAPLACIAN_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define STENCIL_3D_LAPLACIAN_ALIGNMENT 64
#define STENCIL_3D_LAPLACIAN_CAPACITY 2048

typedef struct stencil_3d_laplacian_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} stencil_3d_laplacian_config_t;

typedef struct stencil_3d_laplacian_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    stencil_3d_laplacian_config_t config;
} stencil_3d_laplacian_state_t;

#endif /* STENCIL_3D_LAPLACIAN_TYPES_H */
