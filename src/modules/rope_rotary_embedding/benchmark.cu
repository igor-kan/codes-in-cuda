#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    float* dq; cudaMalloc(&dq, 512 * 16 * 64 * sizeof(float)); cu_rope_rotary_embedding::RopeConfig cfg{512, 16, 64, 10000.0f, 0};
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        cu_rope_rotary_embedding::launch_rope_forward(dq, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("rope_rotary_embedding avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
