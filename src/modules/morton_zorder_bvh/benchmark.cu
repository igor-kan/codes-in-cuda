#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    float *dx, *dy, *dz; std::uint32_t* dc; cudaMalloc(&dx, 65536*4); cudaMalloc(&dy, 65536*4); cudaMalloc(&dz, 65536*4); cudaMalloc(&dc, 65536*4);
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        cu_morton_zorder_bvh::launch_morton3d_encode(dx, dy, dz, dc, 65536, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("morton_zorder_bvh avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
