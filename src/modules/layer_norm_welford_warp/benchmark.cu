#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    float *dx, *dy; cudaMalloc(&dx, 1024 * 1024 * sizeof(float)); cudaMalloc(&dy, 1024 * 1024 * sizeof(float)); cu_layer_norm_welford_warp::LayerNormParams p{1024, 1024, 1e-5f};
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        cu_layer_norm_welford_warp::launch_welford_layernorm(dx, nullptr, nullptr, dy, p, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("layer_norm_welford_warp avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
