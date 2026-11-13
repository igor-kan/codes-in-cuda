/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for 2D 5-Point Laplace Stencil with Shared Memory Halo.
 * Module: stencil_2d_laplace_shared | Algorithm Family: stencil_shared
 */

#ifndef STENCIL_2D_LAPLACE_SHARED_TYPES_H
#define STENCIL_2D_LAPLACE_SHARED_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define STENCIL_2D_LAPLACE_SHARED_ALIGNMENT 64
#define STENCIL_2D_LAPLACE_SHARED_CAPACITY 2048

typedef struct stencil_2d_laplace_shared_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} stencil_2d_laplace_shared_config_t;

typedef struct stencil_2d_laplace_shared_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    stencil_2d_laplace_shared_config_t config;
} stencil_2d_laplace_shared_state_t;

#endif /* STENCIL_2D_LAPLACE_SHARED_TYPES_H */
