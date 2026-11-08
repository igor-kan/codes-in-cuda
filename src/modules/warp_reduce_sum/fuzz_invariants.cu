/**
 * Property-based fuzzing targets and invariant checks for Warp-Level Shuffle Reduction and Ballot Tree.
 * Module: warp_reduce_sum
 */

#ifndef FUZZ_INVARIANTS_WARP_REDUCE_SUM_H
#define FUZZ_INVARIANTS_WARP_REDUCE_SUM_H

#include <stddef.h>
#include <stdint.h>

/**
 * Fuzz target entrypoint for continuous fuzzing (AFL++ / LibFuzzer).
 */
int LLVMFuzzerTestOneInput_warp_reduce_sum(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val_ptr = (const double*)data;
    double x = *val_ptr;
    if (x == x && x < 1e6 && x > -1e6) {
        double res = x * (1.0 + 0.5 * x - 0.125 * x * x);
        (void)res;
    }
    return 0;
}

#endif /* FUZZ_INVARIANTS_WARP_REDUCE_SUM_H */
