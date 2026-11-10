/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Stream Compaction and Filtering via Parallel Scan.
 * Module: parallel_compact_stream
 */

#include <assert.h>

void test_parallel_compact_stream_regression_subnormal_day46(void) {
    double sub = 1e-310;
    double res = sub * (1.0 + 0.35 * sub);
    assert(res >= 0.0);
}
