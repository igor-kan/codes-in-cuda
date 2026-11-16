#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    BatchEigenConfig cfg{8192, 12, 1e-6f}; float *ds=nullptr,*dv=nullptr,*dq=nullptr; cudaMalloc(&ds,8192*24); cudaMalloc(&dv,8192*12); cudaMalloc(&dq,8192*36);
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        launch_batched_eigen3x3(ds, dv, dq, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("jacobi_eigen_batch3x3 avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
