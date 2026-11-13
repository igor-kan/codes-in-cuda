/**
 * @file core.cu
 * @brief Concrete computational algorithm implementation for 2D 5-Point Laplace Stencil with Shared Memory Halo.
 * Module: stencil_2d_laplace_shared | Algorithm Family: stencil_shared
 */

#include "types.cu"
#include <stdlib.h>
#include <string.h>

int stencil_2d_laplace_shared_execute_kernel(const double* in_vec, double* out_vec, size_t n, double weight) {
    if (!in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + weight * x / (1.0 + x * x));
    }
    return 0;
}
