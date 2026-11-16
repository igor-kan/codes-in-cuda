#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    BilateralConfig cfg{512, 512, 2, 0.1f, 0.5f}; float *di=nullptr,*do_=nullptr; cudaMalloc(&di,512*512*4); cudaMalloc(&do_,512*512*4);
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        launch_bilateral_shared(di, do_, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("bilateral_filter_shared2d avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
