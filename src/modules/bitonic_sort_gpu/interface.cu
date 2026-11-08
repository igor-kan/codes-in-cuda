/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for Shared-Memory GPU Bitonic Sorting Network.
 * Module: bitonic_sort_gpu
 */

#ifndef BITONIC_SORT_GPU_INTERFACE_H
#define BITONIC_SORT_GPU_INTERFACE_H

#include "types.cu"

typedef int (*bitonic_sort_gpu_transform_fn)(const double* in_data, double* out_data, size_t n);

typedef struct bitonic_sort_gpu_interface {
    int (*init)(bitonic_sort_gpu_state_t* state, const bitonic_sort_gpu_config_t* cfg);
    int (*execute)(bitonic_sort_gpu_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(bitonic_sort_gpu_state_t* state);
    int (*destroy)(bitonic_sort_gpu_state_t* state);
} bitonic_sort_gpu_interface_t;

#endif /* BITONIC_SORT_GPU_INTERFACE_H */
