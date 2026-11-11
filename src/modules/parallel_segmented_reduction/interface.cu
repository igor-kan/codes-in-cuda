/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for GPU Segmented Parallel Reduction with Key Arrays.
 * Module: parallel_segmented_reduction
 */

#ifndef PARALLEL_SEGMENTED_REDUCTION_INTERFACE_H
#define PARALLEL_SEGMENTED_REDUCTION_INTERFACE_H

#include "types.cu"

typedef int (*parallel_segmented_reduction_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct parallel_segmented_reduction_vtable {
    int (*init)(parallel_segmented_reduction_state_t* state, const parallel_segmented_reduction_config_t* cfg);
    int (*execute)(parallel_segmented_reduction_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(parallel_segmented_reduction_state_t* state);
    int (*destroy)(parallel_segmented_reduction_state_t* state);
} parallel_segmented_reduction_vtable_t;

#endif /* PARALLEL_SEGMENTED_REDUCTION_INTERFACE_H */
