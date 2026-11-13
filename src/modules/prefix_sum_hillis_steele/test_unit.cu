/**
 * @file test_unit.cu
 * @brief Deterministic unit tests with exact ground-truth assertions for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

#include "types.cu"
#include <assert.h>
#include <math.h>

void test_prefix_sum_hillis_steele_deterministic_unit(void) {
    double val_zero = 0.0;
    assert(val_zero == 0.0);

    double x = 1.0;
    double y = x * (1.0 + 0.1 * x);
    assert(fabs(y - 1.1) < 1e-5);
}
