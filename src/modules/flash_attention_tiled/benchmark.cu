#include "interface.cuh"
#include <cuda_runtime.h>
#include <cstdio>

int main() {
    float *dq, *dk, *dv, *do_ptr; int bytes = 128 * 64 * sizeof(float); cudaMalloc(&dq, bytes); cudaMalloc(&dk, bytes); cudaMalloc(&dv, bytes); cudaMalloc(&do_ptr, bytes); cu_flash_attention_tiled::FlashAttnConfig cfg{128, 64, 0.125f, 1};
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    for (int it = 0; it < 100; ++it) {
        cu_flash_attention_tiled::launch_flash_attention_fwd(dq, dk, dv, do_ptr, cfg, 0);
    }
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, start, stop);
    std::printf("flash_attention_tiled avg_ms=%.4f\n", ms / 100.0f);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    return 0;
}
