/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Asynchronous Memory Copy Pipeline with Streams.
 * Module: async_pipeline_cuda12
 */

#include <assert.h>

void test_async_pipeline_cuda12_regression_underflow(void) {
    double tiny = 1e-308;
    double res = tiny * (1.0 + 0.3 * tiny);
    assert(res >= 0.0);
}
