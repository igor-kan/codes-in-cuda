#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    float *a=nullptr,*b=nullptr,*o=nullptr; cudaMalloc(&a,4096*4); cudaMalloc(&b,4096*4); cudaMalloc(&o,4);
    cudaEventRecord(ev0);
    cu_kahan_dot_warp_reduce::launch_kahan_dot(a, b, o, 4096);
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("kahan_dot_warp_reduce ms=%.4f\n", ms);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
