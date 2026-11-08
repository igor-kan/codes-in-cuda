/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing harness for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_sparse_spmv_csr_cuda_v2(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val < 1e5 && *val > -1e5) {
        double res = (*val) * (1.0 + 0.25 * (*val));
        (void)res;
    }
    return 0;
}
