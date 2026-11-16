#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    Trsv32Config cfg{256, 1.0f}; float *du=nullptr,*db=nullptr,*dx=nullptr; cudaMalloc(&du,256*1024*4); cudaMalloc(&db,256*32*4); cudaMalloc(&dx,256*32*4);
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        launch_trsv32_warp(du, db, dx, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("upper_triangular_trsv_warp avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
