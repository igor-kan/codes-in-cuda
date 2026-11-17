#include "interface.cuh"
#include <cassert>
namespace cu_sparse_coo_to_csr_gpu {
void verify_monotone_row_ptr(const int* row_ptr, int rows, int nnz) {
    assert(row_ptr[0] == 0 && row_ptr[rows] == nnz);
    for (int i = 0; i < rows; ++i) assert(row_ptr[i] <= row_ptr[i + 1]);
}
} // namespace cu_sparse_coo_to_csr_gpu