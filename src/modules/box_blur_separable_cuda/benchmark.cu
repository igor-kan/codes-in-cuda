#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    float *di=nullptr,*dt=nullptr,*do_=nullptr; cudaMalloc(&di,4096*4); cudaMalloc(&dt,4096*4); cudaMalloc(&do_,4096*4);
    cudaEventRecord(ev0);
    cu_box_blur_separable_cuda::launch_separable_blur(di, dt, do_, {64, 64, 2});
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("box_blur_separable_cuda ms=%.4f\n", ms);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
