#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    float *din, *dout; cudaMalloc(&din, 1024 * 1024 * sizeof(float)); cudaMalloc(&dout, 1024 * 1024 * sizeof(float)); cu_sobel_edge_shared::ImageSpec spec{1024, 1024};
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        cu_sobel_edge_shared::launch_sobel_shared(din, dout, spec, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("sobel_edge_shared avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
