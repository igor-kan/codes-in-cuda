#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    float *di=nullptr,*df=nullptr,*do_=nullptr; cudaMalloc(&di,2048*4); cudaMalloc(&df,9*4); cudaMalloc(&do_,2048*4);
    cudaEventRecord(ev0);
    cu_convolution_1d_halo_shared::launch_conv1d_halo(di, df, do_, {2048, 4, 1.0f});
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("convolution_1d_halo_shared ms=%.4f\n", ms);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
