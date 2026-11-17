#include "interface.cuh"
namespace cu_sparse_coo_to_csr_gpu {
__global__ void prefix_scan_rows(int* row_ptr, int num_rows) {
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        for (int i = 1; i <= num_rows; ++i) row_ptr[i] += row_ptr[i - 1];
    }
}
} // namespace cu_sparse_coo_to_csr_gpu