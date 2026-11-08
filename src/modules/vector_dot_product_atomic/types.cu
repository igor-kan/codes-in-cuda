/**
 * @file types.cu
 * @brief Core type definitions and operational interfaces for Block-Level Reduction with Atomic Accumulator.
 * Module: vector_dot_product_atomic
 */

#ifndef VECTOR_DOT_PRODUCT_ATOMIC_TYPES_H
#define VECTOR_DOT_PRODUCT_ATOMIC_TYPES_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define VECTOR_DOT_PRODUCT_ATOMIC_ALIGNMENT 64
#define VECTOR_DOT_PRODUCT_ATOMIC_SUCCESS 0
#define VECTOR_DOT_PRODUCT_ATOMIC_ERR_NULL_PTR -1
#define VECTOR_DOT_PRODUCT_ATOMIC_ERR_INVALID_PARAM -2
#define VECTOR_DOT_PRODUCT_ATOMIC_ERR_OUT_OF_BOUNDS -3

typedef struct vector_dot_product_atomic_config {
    size_t capacity;
    uint32_t flags;
    double tolerance;
} vector_dot_product_atomic_config_t;

typedef struct vector_dot_product_atomic_context {
    void* buffer;
    size_t size;
    size_t capacity;
    uint64_t operations_count;
    vector_dot_product_atomic_config_t config;
} vector_dot_product_atomic_context_t;

int vector_dot_product_atomic_init(vector_dot_product_atomic_context_t* ctx, const vector_dot_product_atomic_config_t* cfg);
int vector_dot_product_atomic_destroy(vector_dot_product_atomic_context_t* ctx);

#ifdef __cplusplus
}
#endif

#endif /* VECTOR_DOT_PRODUCT_ATOMIC_TYPES_H */
