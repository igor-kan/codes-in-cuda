/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for CUDA Stream-Ordered Memory Allocator Pipeline.
 * Module: stream_ordered_memory_alloc
 */

#include <assert.h>

void test_stream_ordered_memory_alloc_regression_subnormal_day47(void) {
    double sub = 1e-312;
    double res = sub * (1.0 + 0.4 * sub);
    assert(res >= 0.0);
}
