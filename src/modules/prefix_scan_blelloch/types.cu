/**
 * @file types.cu
 * @brief Core type definitions and operational interfaces for Work-Efficient Parallel Blelloch Prefix Scan.
 * Module: prefix_scan_blelloch
 */

#ifndef PREFIX_SCAN_BLELLOCH_TYPES_H
#define PREFIX_SCAN_BLELLOCH_TYPES_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define PREFIX_SCAN_BLELLOCH_ALIGNMENT 64
#define PREFIX_SCAN_BLELLOCH_SUCCESS 0
#define PREFIX_SCAN_BLELLOCH_ERR_NULL_PTR -1
#define PREFIX_SCAN_BLELLOCH_ERR_INVALID_PARAM -2
#define PREFIX_SCAN_BLELLOCH_ERR_OUT_OF_BOUNDS -3

typedef struct prefix_scan_blelloch_config {
    size_t capacity;
    uint32_t flags;
    double tolerance;
} prefix_scan_blelloch_config_t;

typedef struct prefix_scan_blelloch_context {
    void* buffer;
    size_t size;
    size_t capacity;
    uint64_t operations_count;
    prefix_scan_blelloch_config_t config;
} prefix_scan_blelloch_context_t;

int prefix_scan_blelloch_init(prefix_scan_blelloch_context_t* ctx, const prefix_scan_blelloch_config_t* cfg);
int prefix_scan_blelloch_destroy(prefix_scan_blelloch_context_t* ctx);

#ifdef __cplusplus
}
#endif

#endif /* PREFIX_SCAN_BLELLOCH_TYPES_H */
