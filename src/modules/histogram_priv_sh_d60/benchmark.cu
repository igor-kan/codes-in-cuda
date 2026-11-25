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
    cu_histogram_priv_sh_d60::hist_priv32_kernel_d60<<<1, 256>>>(d_a, d_b, 256);
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("histogram_priv_sh_d60 ms=%.4f\n", ms);
    cudaFree(d_a);
    cudaFree(d_b);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
