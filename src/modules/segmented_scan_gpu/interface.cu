/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for GPU Segmented Work-Efficient Prefix Scan.
 * Module: segmented_scan_gpu
 */

#ifndef SEGMENTED_SCAN_GPU_INTERFACE_H
#define SEGMENTED_SCAN_GPU_INTERFACE_H

#include "types.cu"

typedef int (*segmented_scan_gpu_transform_fn)(const double* in_data, double* out_data, size_t n);

typedef struct segmented_scan_gpu_interface {
    int (*init)(segmented_scan_gpu_state_t* state, const segmented_scan_gpu_config_t* cfg);
    int (*execute)(segmented_scan_gpu_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(segmented_scan_gpu_state_t* state);
    int (*destroy)(segmented_scan_gpu_state_t* state);
} segmented_scan_gpu_interface_t;

#endif /* SEGMENTED_SCAN_GPU_INTERFACE_H */
