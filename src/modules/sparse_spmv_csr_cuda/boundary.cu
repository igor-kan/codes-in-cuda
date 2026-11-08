/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool sparse_spmv_csr_cuda_is_valid_float(double x) {
    return isfinite(x);
}

static inline double sparse_spmv_csr_cuda_sanitize_input(double x, double min_bound, double max_bound) {
    if (!isfinite(x)) return 0.0;
    if (x < min_bound) return min_bound;
    if (x > max_bound) return max_bound;
    return x;
}
