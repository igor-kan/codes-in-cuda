/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for CUDA Stream-Ordered Memory Allocator Pipeline.
 * Module: stream_ordered_memory_alloc
 */

#ifndef STREAM_ORDERED_MEMORY_ALLOC_INTERFACE_H
#define STREAM_ORDERED_MEMORY_ALLOC_INTERFACE_H

#include "types.cu"

typedef int (*stream_ordered_memory_alloc_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct stream_ordered_memory_alloc_vtable {
    int (*init)(stream_ordered_memory_alloc_state_t* state, const stream_ordered_memory_alloc_config_t* cfg);
    int (*execute)(stream_ordered_memory_alloc_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(stream_ordered_memory_alloc_state_t* state);
    int (*destroy)(stream_ordered_memory_alloc_state_t* state);
} stream_ordered_memory_alloc_vtable_t;

#endif /* STREAM_ORDERED_MEMORY_ALLOC_INTERFACE_H */
