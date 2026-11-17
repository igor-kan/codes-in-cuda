#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    int *rp=nullptr,*ci=nullptr; float *v=nullptr,*b=nullptr,*xo=nullptr,*xn=nullptr; cudaMalloc(&rp,257*4); cudaMalloc(&ci,1024*4); cudaMalloc(&v,1024*4); cudaMalloc(&b,256*4); cudaMalloc(&xo,256*4); cudaMalloc(&xn,256*4);
    cudaEventRecord(ev0);
    cu_csr_jacobi_spmv_iter::launch_csr_jacobi_step(rp, ci, v, b, xo, xn, {256, 0.8f});
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("csr_jacobi_spmv_iter ms=%.4f\n", ms);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
