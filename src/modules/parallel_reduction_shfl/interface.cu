/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

#ifndef PARALLEL_REDUCTION_SHFL_INTERFACE_H
#define PARALLEL_REDUCTION_SHFL_INTERFACE_H

#include "types.cu"

typedef int (*parallel_reduction_shfl_transform_fn)(const double* in_data, double* out_data, size_t n);

typedef struct parallel_reduction_shfl_interface {
    int (*init)(parallel_reduction_shfl_state_t* state, const parallel_reduction_shfl_config_t* cfg);
    int (*execute)(parallel_reduction_shfl_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(parallel_reduction_shfl_state_t* state);
    int (*destroy)(parallel_reduction_shfl_state_t* state);
} parallel_reduction_shfl_interface_t;

#endif /* PARALLEL_REDUCTION_SHFL_INTERFACE_H */
