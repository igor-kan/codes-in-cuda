#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    float *dp, *dg, *dm, *dv; int N = 1 << 20; cudaMalloc(&dp, N*4); cudaMalloc(&dg, N*4); cudaMalloc(&dm, N*4); cudaMalloc(&dv, N*4); cu_adamw_fused_optimizer::AdamWConfig cfg{1e-3f, 0.9f, 0.999f, 1e-8f, 0.01f, 5, N};
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        cu_adamw_fused_optimizer::launch_adamw_fused(dp, dg, dm, dv, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("adamw_fused_optimizer avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
