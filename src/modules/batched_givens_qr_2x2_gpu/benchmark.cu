#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 1024 * sizeof(float));
    cudaMalloc(&d_b, 1024 * sizeof(float));
    cudaEventRecord(ev0);
    cu_batched_givens_qr_2x2_gpu::launch_batched_givens(d_a, d_b, 256);
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("batched_givens_qr_2x2_gpu ms=%.4f\n", ms);
    cudaFree(d_a);
    cudaFree(d_b);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
