#include "var_cvar_historical_percentile_kernel.cuh"

__global__ void pnl_scale_kernel(float* pnl, float portfolio_val, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    pnl[idx] *= portfolio_val;
}
