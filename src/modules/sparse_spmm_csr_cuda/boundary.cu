/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Sparse Matrix Dense Matrix (SpMM) GPU Accelerator.
 * Module: sparse_spmm_csr_cuda
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool sparse_spmm_csr_cuda_is_valid_float(double x) {
    return isfinite(x);
}

static inline double sparse_spmm_csr_cuda_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
