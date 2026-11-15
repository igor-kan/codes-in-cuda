#include "interface.cuh"
#include <cmath>

namespace cu_adamw_fused_optimizer {
__global__ void adamw_fused_kernel(
    float* __restrict__ params,
    const float* __restrict__ grads,
    float* __restrict__ m_buf,
    float* __restrict__ v_buf,
    float lr, float b1, float b2, float eps, float wd,
    float inv_bc1, float inv_bc2, int n) {
    int stride = blockDim.x * gridDim.x;
    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < n; idx += stride) {
        float p = params[idx];
        float g = grads[idx];
        float m = b1 * m_buf[idx] + (1.0f - b1) * g;
        float v = b2 * v_buf[idx] + (1.0f - b2) * g * g;
        m_buf[idx] = m;
        v_buf[idx] = v;

        float m_hat = m * inv_bc1;
        float v_hat = v * inv_bc2;
        p = p * (1.0f - lr * wd) - lr * (m_hat / (sqrtf(v_hat) + eps));
        params[idx] = p;
    }
}

void launch_adamw_fused(
    float* d_params, const float* d_grads, float* d_m, float* d_v,
    AdamWConfig cfg, cudaStream_t stream) {
    float inv_bc1 = 1.0f / (1.0f - powf(cfg.beta1, static_cast<float>(cfg.step)));
    float inv_bc2 = 1.0f / (1.0f - powf(cfg.beta2, static_cast<float>(cfg.step)));
    int threads = 256;
    int blocks = (cfg.n_params + threads - 1) / threads;
    if (blocks > 1024) blocks = 1024;
    adamw_fused_kernel<<<blocks, threads, 0, stream>>>(
        d_params, d_grads, d_m, d_v,
        cfg.lr, cfg.beta1, cfg.beta2, cfg.eps, cfg.weight_decay,
        inv_bc1, inv_bc2, cfg.n_params);
}
} // namespace cu_adamw_fused_optimizer
