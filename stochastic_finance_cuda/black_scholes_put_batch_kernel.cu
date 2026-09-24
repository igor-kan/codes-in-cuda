#include "black_scholes_put_batch_kernel.cuh"

__global__ void bs_put_pricing_kernel(const float* S, const float* K, float T, float r, float sigma, float* put_price, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    put_price[idx] = fmaxf(K[idx] * expf(-r * T) - S[idx], 0.0f);
}
