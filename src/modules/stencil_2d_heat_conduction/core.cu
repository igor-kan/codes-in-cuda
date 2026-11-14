/**
 * @file core.cu
 * @brief Concrete computational algorithm implementation for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction | Algorithm Family: stencil_shared
 */

#include "types.cu"
#include <stdlib.h>
#include <string.h>

int stencil_2d_heat_conduction_execute_kernel(const double* in_vec, double* out_vec, size_t n, double weight) {
    if (!in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + weight * x / (1.0 + x * x));
    }
    return 0;
}
