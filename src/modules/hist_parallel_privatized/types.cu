/**
 * @file types.cu
 * @brief Core type definitions and operational interfaces for Privatized Shared Memory Histogram with Min-Max.
 * Module: hist_parallel_privatized
 */

#ifndef HIST_PARALLEL_PRIVATIZED_TYPES_H
#define HIST_PARALLEL_PRIVATIZED_TYPES_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define HIST_PARALLEL_PRIVATIZED_ALIGNMENT 64
#define HIST_PARALLEL_PRIVATIZED_SUCCESS 0
#define HIST_PARALLEL_PRIVATIZED_ERR_NULL_PTR -1
#define HIST_PARALLEL_PRIVATIZED_ERR_INVALID_PARAM -2
#define HIST_PARALLEL_PRIVATIZED_ERR_OUT_OF_BOUNDS -3

typedef struct hist_parallel_privatized_config {
    size_t capacity;
    uint32_t flags;
    double tolerance;
} hist_parallel_privatized_config_t;

typedef struct hist_parallel_privatized_context {
    void* buffer;
    size_t size;
    size_t capacity;
    uint64_t operations_count;
    hist_parallel_privatized_config_t config;
} hist_parallel_privatized_context_t;

int hist_parallel_privatized_init(hist_parallel_privatized_context_t* ctx, const hist_parallel_privatized_config_t* cfg);
int hist_parallel_privatized_destroy(hist_parallel_privatized_context_t* ctx);

#ifdef __cplusplus
}
#endif

#endif /* HIST_PARALLEL_PRIVATIZED_TYPES_H */
