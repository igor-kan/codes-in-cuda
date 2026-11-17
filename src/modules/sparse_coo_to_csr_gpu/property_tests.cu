#include "interface.cuh"
int main() {
    int *cr = nullptr, *cc = nullptr, *rp = nullptr, *out = nullptr;
    cudaMalloc(&cr, 64 * sizeof(int)); cudaMalloc(&cc, 64 * sizeof(int));
    cudaMalloc(&rp, 17 * sizeof(int)); cudaMalloc(&out, 64 * sizeof(int));
    cu_sparse_coo_to_csr_gpu::convert_coo_to_csr_gpu(cr, cc, rp, out, {16, 64});
    cudaFree(cr); cudaFree(cc); cudaFree(rp); cudaFree(out);
    return 0;
}