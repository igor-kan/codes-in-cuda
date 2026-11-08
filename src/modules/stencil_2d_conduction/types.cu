/**
 * @file types.cu
 * @brief Core type definitions and operational interfaces for 9-Point Thermal Conduction Stencil with Shared Memory.
 * Module: stencil_2d_conduction
 */

#ifndef STENCIL_2D_CONDUCTION_TYPES_H
#define STENCIL_2D_CONDUCTION_TYPES_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define STENCIL_2D_CONDUCTION_ALIGNMENT 64
#define STENCIL_2D_CONDUCTION_SUCCESS 0
#define STENCIL_2D_CONDUCTION_ERR_NULL_PTR -1
#define STENCIL_2D_CONDUCTION_ERR_INVALID_PARAM -2
#define STENCIL_2D_CONDUCTION_ERR_OUT_OF_BOUNDS -3

typedef struct stencil_2d_conduction_config {
    size_t capacity;
    uint32_t flags;
    double tolerance;
} stencil_2d_conduction_config_t;

typedef struct stencil_2d_conduction_context {
    void* buffer;
    size_t size;
    size_t capacity;
    uint64_t operations_count;
    stencil_2d_conduction_config_t config;
} stencil_2d_conduction_context_t;

int stencil_2d_conduction_init(stencil_2d_conduction_context_t* ctx, const stencil_2d_conduction_config_t* cfg);
int stencil_2d_conduction_destroy(stencil_2d_conduction_context_t* ctx);

#ifdef __cplusplus
}
#endif

#endif /* STENCIL_2D_CONDUCTION_TYPES_H */
