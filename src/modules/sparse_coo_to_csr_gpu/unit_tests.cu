#include "interface.cuh"
int main() {
    int *cr = nullptr, *cc = nullptr, *rp = nullptr, *out = nullptr;
    cudaMalloc(&cr, 16 * sizeof(int)); cudaMalloc(&cc, 16 * sizeof(int));
    cudaMalloc(&rp, 9 * sizeof(int)); cudaMalloc(&out, 16 * sizeof(int));
    cudaMemset(rp, 0, 9 * sizeof(int));
    cu_sparse_coo_to_csr_gpu::convert_coo_to_csr_gpu(cr, cc, rp, out, {8, 16});
    cudaFree(cr); cudaFree(cc); cudaFree(rp); cudaFree(out);
    return 0;
}