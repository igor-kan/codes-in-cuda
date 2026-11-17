#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    float *a=nullptr,*b=nullptr,*c=nullptr,*d=nullptr; cudaMalloc(&a,1024*4); cudaMalloc(&b,1024*4); cudaMalloc(&c,1024*4); cudaMalloc(&d,1024*4);
    cudaEventRecord(ev0);
    cu_batched_tridiag_pcr_cuda::launch_pcr_batch(a, b, c, d, {64, 16});
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("batched_tridiag_pcr_cuda ms=%.4f\n", ms);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
