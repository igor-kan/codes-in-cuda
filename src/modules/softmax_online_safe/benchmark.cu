#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    float *di, *dout; cudaMalloc(&di, 512 * 1024 * sizeof(float)); cudaMalloc(&dout, 512 * 1024 * sizeof(float)); cu_softmax_online_safe::SoftmaxConfig cfg{512, 1024};
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        cu_softmax_online_safe::launch_online_softmax(di, dout, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("softmax_online_safe avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
