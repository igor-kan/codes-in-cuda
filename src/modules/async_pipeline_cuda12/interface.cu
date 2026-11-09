/**
 * @file interface.cu
 * @brief Abstract contracts and prototypes for Asynchronous Memory Copy Pipeline with Streams.
 * Module: async_pipeline_cuda12
 */

#ifndef ASYNC_PIPELINE_CUDA12_INTERFACE_H
#define ASYNC_PIPELINE_CUDA12_INTERFACE_H

#include "types.cu"

typedef int (*async_pipeline_cuda12_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct async_pipeline_cuda12_vtable {
    int (*init)(async_pipeline_cuda12_state_t* state, const async_pipeline_cuda12_config_t* cfg);
    int (*execute)(async_pipeline_cuda12_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*destroy)(async_pipeline_cuda12_state_t* state);
} async_pipeline_cuda12_vtable_t;

#endif /* ASYNC_PIPELINE_CUDA12_INTERFACE_H */
