#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    RmsNormConfig cfg{512, 1024, 1e-6f, 256}; float *dx=nullptr,*dg=nullptr,*dy=nullptr; cudaMalloc(&dx, 512*1024*4); cudaMalloc(&dg, 1024*4); cudaMalloc(&dy, 512*1024*4);
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        launch_rms_norm_vec4(dx, dg, dy, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("rms_norm_warp_fused avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
