/**
 * @file types.cu
 * @brief Core type definitions and operational interfaces for Tensor Core WMMA Mixed-Precision GEMM Acceleration.
 * Module: batch_gemm_wmma
 */

#ifndef BATCH_GEMM_WMMA_TYPES_H
#define BATCH_GEMM_WMMA_TYPES_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define BATCH_GEMM_WMMA_ALIGNMENT 64
#define BATCH_GEMM_WMMA_SUCCESS 0
#define BATCH_GEMM_WMMA_ERR_NULL_PTR -1
#define BATCH_GEMM_WMMA_ERR_INVALID_PARAM -2
#define BATCH_GEMM_WMMA_ERR_OUT_OF_BOUNDS -3

typedef struct batch_gemm_wmma_config {
    size_t capacity;
    uint32_t flags;
    double tolerance;
} batch_gemm_wmma_config_t;

typedef struct batch_gemm_wmma_context {
    void* buffer;
    size_t size;
    size_t capacity;
    uint64_t operations_count;
    batch_gemm_wmma_config_t config;
} batch_gemm_wmma_context_t;

int batch_gemm_wmma_init(batch_gemm_wmma_context_t* ctx, const batch_gemm_wmma_config_t* cfg);
int batch_gemm_wmma_destroy(batch_gemm_wmma_context_t* ctx);

#ifdef __cplusplus
}
#endif

#endif /* BATCH_GEMM_WMMA_TYPES_H */
