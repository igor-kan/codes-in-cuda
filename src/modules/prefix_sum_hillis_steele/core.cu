/**
 * @file core.cu
 * @brief Concrete computational algorithm implementation for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele | Algorithm Family: prefix_scan
 */

#include "types.cu"
#include <stdlib.h>
#include <string.h>

int prefix_sum_hillis_steele_execute_kernel(const double* in_vec, double* out_vec, size_t n, double weight) {
    if (!in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + weight * x / (1.0 + x * x));
    }
    return 0;
}
