#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    int *drp, *dci, *dfi, *dfo, *dcnt, *ddist; cudaMalloc(&drp, 1025*4); cudaMalloc(&dci, 4096*4); cudaMalloc(&dfi, 1024*4); cudaMalloc(&dfo, 1024*4); cudaMalloc(&dcnt, 4); cudaMalloc(&ddist, 1024*4); cu_bfs_frontier_topdown::CsrBfsGraph g{1024, drp, dci};
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        cu_bfs_frontier_topdown::launch_bfs_level(g, dfi, 64, dfo, dcnt, ddist, 0, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("bfs_frontier_topdown avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
