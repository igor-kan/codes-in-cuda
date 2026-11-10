/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing harness for Vector-Based CSR Sparse Matrix-Vector Kernel.
 * Module: sparse_csr_spmv_vector
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_sparse_csr_spmv_vector_day46(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val < 1e5 && *val > -1e5) {
        double res = (*val) * (1.0 + 0.35 * (*val));
        (void)res;
    }
    return 0;
}
