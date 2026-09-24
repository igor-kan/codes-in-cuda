#include "black_scholes_call_batch_kernel.cuh"

__global__ void bs_call_pricing_kernel(const float* S, const float* K, float T, float r, float sigma, float* call_price, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    call_price[idx] = fmaxf(S[idx] - K[idx] * expf(-r * T), 0.0f);
}
