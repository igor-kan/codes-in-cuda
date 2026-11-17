#include "interface.cuh"
namespace cu_batched_tridiag_pcr_cuda {
__global__ void pcr_block_kernel(const float* __restrict__ ga, const float* __restrict__ gb, const float* __restrict__ gc, float* __restrict__ gd, int n) {
    extern __shared__ float sh[];
    float* a = sh;
    float* b = sh + n;
    float* c = sh + 2 * n;
    float* x = sh + 3 * n;
    int sys = blockIdx.x;
    int tid = threadIdx.x;
    if (tid >= n) return;
    int off = sys * n + tid;
    a[tid] = ga[off]; b[tid] = gb[off]; c[tid] = gc[off]; x[tid] = gd[off];
    __syncthreads();
    for (int stride = 1; stride < n; stride <<= 1) {
        int lo = tid - stride, hi = tid + stride;
        float al = (lo >= 0) ? a[tid] / b[lo] : 0.0f;
        float cl = (hi < n) ? c[tid] / b[hi] : 0.0f;
        float nb = b[tid] - (lo >= 0 ? al * c[lo] : 0.0f) - (hi < n ? cl * a[hi] : 0.0f);
        float nx = x[tid] - (lo >= 0 ? al * x[lo] : 0.0f) - (hi < n ? cl * x[hi] : 0.0f);
        float na = (lo >= 0) ? -al * a[lo] : 0.0f;
        float nc = (hi < n) ? -cl * c[hi] : 0.0f;
        __syncthreads();
        a[tid] = na; b[tid] = nb; c[tid] = nc; x[tid] = nx;
        __syncthreads();
    }
    gd[off] = x[tid] / b[tid];
}
void launch_pcr_batch(const float* a, const float* b, const float* c, float* d_rhs, PcrBatch cfg) {
    pcr_block_kernel<<<cfg.batch_count, cfg.sys_size, static_cast<std::size_t>(4 * cfg.sys_size) * sizeof(float)>>>(a, b, c, d_rhs, cfg.sys_size);
}
} // namespace cu_batched_tridiag_pcr_cuda