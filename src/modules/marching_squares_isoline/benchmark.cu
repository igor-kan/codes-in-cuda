#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    IsolineConfig cfg{256, 256, 0.5f}; float *df=nullptr; int *dc=nullptr,*dn=nullptr; cudaMalloc(&df,256*256*4); cudaMalloc(&dc,255*255*4); cudaMalloc(&dn,255*255*4);
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        launch_marching_squares_classify(df, dc, dn, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("marching_squares_isoline avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
