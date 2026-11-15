#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    float *dd, *dq, *ds; cudaMalloc(&dd, 4096*256*4); cudaMalloc(&dq, 256*4); cudaMalloc(&ds, 4096*4);
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        cu_cosine_sim_topk::launch_cosine_scores(dd, dq, ds, 4096, 256, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("cosine_sim_topk avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
