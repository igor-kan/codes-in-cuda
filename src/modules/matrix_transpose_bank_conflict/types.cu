/**
 * @file types.cu
 * @brief Core type definitions and operational interfaces for Bank-Conflict-Free 2D Matrix Transposition.
 * Module: matrix_transpose_bank_conflict
 */

#ifndef MATRIX_TRANSPOSE_BANK_CONFLICT_TYPES_H
#define MATRIX_TRANSPOSE_BANK_CONFLICT_TYPES_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define MATRIX_TRANSPOSE_BANK_CONFLICT_ALIGNMENT 64
#define MATRIX_TRANSPOSE_BANK_CONFLICT_SUCCESS 0
#define MATRIX_TRANSPOSE_BANK_CONFLICT_ERR_NULL_PTR -1
#define MATRIX_TRANSPOSE_BANK_CONFLICT_ERR_INVALID_PARAM -2
#define MATRIX_TRANSPOSE_BANK_CONFLICT_ERR_OUT_OF_BOUNDS -3

typedef struct matrix_transpose_bank_conflict_config {
    size_t capacity;
    uint32_t flags;
    double tolerance;
} matrix_transpose_bank_conflict_config_t;

typedef struct matrix_transpose_bank_conflict_context {
    void* buffer;
    size_t size;
    size_t capacity;
    uint64_t operations_count;
    matrix_transpose_bank_conflict_config_t config;
} matrix_transpose_bank_conflict_context_t;

int matrix_transpose_bank_conflict_init(matrix_transpose_bank_conflict_context_t* ctx, const matrix_transpose_bank_conflict_config_t* cfg);
int matrix_transpose_bank_conflict_destroy(matrix_transpose_bank_conflict_context_t* ctx);

#ifdef __cplusplus
}
#endif

#endif /* MATRIX_TRANSPOSE_BANK_CONFLICT_TYPES_H */
