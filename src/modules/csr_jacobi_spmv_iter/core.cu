#include "interface.cuh"
namespace cu_csr_jacobi_spmv_iter {
__global__ void csr_jacobi_kernel(const int* __restrict__ rp, const int* __restrict__ ci, const float* __restrict__ val,
                                      const float* __restrict__ b, const float* __restrict__ x_old, float* __restrict__ x_new, int rows, float omega) {
    int r = blockIdx.x * blockDim.x + threadIdx.x;
    if (r >= rows) return;
    float diag = 1.0f, off = 0.0f;
    for (int e = rp[r]; e < rp[r + 1]; ++e) {
        int c = ci[e];
        if (c == r) diag = val[e];
        else off += val[e] * x_old[c];
    }
    float gs = (b[r] - off) / diag;
    x_new[r] = (1.0f - omega) * x_old[r] + omega * gs;
}
void launch_csr_jacobi_step(const int* rp, const int* ci, const float* val, const float* b, const float* x_old, float* x_new, JacobiCfg cfg) {
    int blk = (cfg.rows + 255) / 256;
    csr_jacobi_kernel<<<blk, 256>>>(rp, ci, val, b, x_old, x_new, cfg.rows, cfg.omega);
}
} // namespace cu_csr_jacobi_spmv_iter