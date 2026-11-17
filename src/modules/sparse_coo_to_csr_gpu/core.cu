#include "interface.cuh"
namespace cu_sparse_coo_to_csr_gpu {
__global__ void count_row_degrees(const int* __restrict__ coo_r, int* __restrict__ row_ptr, int nnz) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < nnz) atomicAdd(&row_ptr[coo_r[tid] + 1], 1);
}
__global__ void scatter_edges(const int* __restrict__ coo_r, const int* __restrict__ coo_c, const int* __restrict__ row_ptr, int* __restrict__ cursor, int* __restrict__ csr_c, int nnz) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < nnz) {
        int r = coo_r[tid];
        int dst = row_ptr[r] + atomicAdd(&cursor[r], 1);
        csr_c[dst] = coo_c[tid];
    }
}
void convert_coo_to_csr_gpu(const int* d_coo_row, const int* d_coo_col, int* d_row_ptr, int* d_csr_col, CooToCsrArgs args) {
    int blocks = (args.nnz + 255) / 256;
    count_row_degrees<<<blocks, 256>>>(d_coo_row, d_row_ptr, args.nnz);
    (void)d_coo_col; (void)d_csr_col;
}
} // namespace cu_sparse_coo_to_csr_gpu