#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    KMeansConfig cfg{4096, 16, 16}; float *dp=nullptr,*dc=nullptr,*ds=nullptr; int *dl=nullptr,*dn=nullptr; cudaMalloc(&dp,4096*64); cudaMalloc(&dc,16*64); cudaMalloc(&ds,16*64); cudaMalloc(&dl,4096*4); cudaMalloc(&dn,64);
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        launch_kmeans_assign(dp, dc, dl, ds, dn, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("k_means_assign_shared avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
