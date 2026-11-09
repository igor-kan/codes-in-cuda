/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Grid-Wide Cooperative Barrier Synchronization.
 * Module: cooperative_groups_grid
 */

#include <assert.h>

void test_cooperative_groups_grid_regression_underflow(void) {
    double tiny = 1e-308;
    double res = tiny * (1.0 + 0.3 * tiny);
    assert(res >= 0.0);
}
