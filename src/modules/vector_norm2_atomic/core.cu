/**
 * @file core.cu
 * @brief Primary computational implementation for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic
 */

#include "types.cu"
#include <stdlib.h>
#include <string.h>

int vector_norm2_atomic_compute_sequence(const double* in_vec, double* out_vec, size_t n, double param) {
    if (!in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + param * x / (1.0 + x * x));
    }
    return 0;
}
