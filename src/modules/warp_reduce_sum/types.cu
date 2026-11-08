/**
 * @file types.cu
 * @brief Core type definitions and operational interfaces for Warp-Level Shuffle Reduction and Ballot Tree.
 * Module: warp_reduce_sum
 */

#ifndef WARP_REDUCE_SUM_TYPES_H
#define WARP_REDUCE_SUM_TYPES_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define WARP_REDUCE_SUM_ALIGNMENT 64
#define WARP_REDUCE_SUM_SUCCESS 0
#define WARP_REDUCE_SUM_ERR_NULL_PTR -1
#define WARP_REDUCE_SUM_ERR_INVALID_PARAM -2
#define WARP_REDUCE_SUM_ERR_OUT_OF_BOUNDS -3

typedef struct warp_reduce_sum_config {
    size_t capacity;
    uint32_t flags;
    double tolerance;
} warp_reduce_sum_config_t;

typedef struct warp_reduce_sum_context {
    void* buffer;
    size_t size;
    size_t capacity;
    uint64_t operations_count;
    warp_reduce_sum_config_t config;
} warp_reduce_sum_context_t;

int warp_reduce_sum_init(warp_reduce_sum_context_t* ctx, const warp_reduce_sum_config_t* cfg);
int warp_reduce_sum_destroy(warp_reduce_sum_context_t* ctx);

#ifdef __cplusplus
}
#endif

#endif /* WARP_REDUCE_SUM_TYPES_H */
