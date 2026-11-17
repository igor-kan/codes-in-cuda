#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_sparse_coo_to_csr_gpu {
void convert_coo_to_csr_gpu(const int* d_coo_row, const int* d_coo_col, int* d_row_ptr, int* d_csr_col, CooToCsrArgs args);
} // namespace cu_sparse_coo_to_csr_gpu
