#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    int *cr=nullptr,*cc=nullptr,*rp=nullptr,*o=nullptr; cudaMalloc(&cr,1024*4); cudaMalloc(&cc,1024*4); cudaMalloc(&rp,129*4); cudaMalloc(&o,1024*4);
    cudaEventRecord(ev0);
    cu_sparse_coo_to_csr_gpu::convert_coo_to_csr_gpu(cr, cc, rp, o, {128, 1024});
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("sparse_coo_to_csr_gpu ms=%.4f\n", ms);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
