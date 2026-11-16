#include "interface.cuh"
#include <cmath>

__device__ __forceinline__ void jacobi_step(float& app, float& aqq, float& apq, float& ap_other, float& aq_other,
                                            float& vp0, float& vp1, float& vp2, float& vq0, float& vq1, float& vq2) {
    if (fabsf(apq) < 1e-8f) return;
    float tau = (aqq - app) / (2.0f * apq);
    float t = (tau >= 0.0f) ? (1.0f / (tau + sqrtf(1.0f + tau * tau)))
                            : (-1.0f / (-tau + sqrtf(1.0f + tau * tau)));
    float c = rsqrtf(1.0f + t * t);
    float s = t * c;
    float new_app = app - t * apq;
    float new_aqq = aqq + t * apq;
    app = new_app; aqq = new_aqq; apq = 0.0f;
    float o0 = c * ap_other - s * aq_other;
    float o1 = s * ap_other + c * aq_other;
    ap_other = o0; aq_other = o1;
    auto rot = [&](float& x, float& y) { float nx = c * x - s * y; y = s * x + c * y; x = nx; };
    rot(vp0, vq0); rot(vp1, vq1); rot(vp2, vq2);
}

__global__ void eigen3x3_kernel(const float* __restrict__ sym6, float* __restrict__ eval3, float* __restrict__ evec9, int n, int sweeps) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    const float* s = sym6 + idx * 6;
    float a00 = s[0], a01 = s[1], a02 = s[2], a11 = s[3], a12 = s[4], a22 = s[5];
    float v00=1, v01=0, v02=0, v10=0, v11=1, v12=0, v20=0, v21=0, v22=1;
    for (int sw = 0; sw < sweeps; ++sw) {
        jacobi_step(a00, a11, a01, a02, a12, v00, v10, v20, v01, v11, v21);
        jacobi_step(a00, a22, a02, a01, a12, v00, v10, v20, v02, v12, v22);
        jacobi_step(a11, a22, a12, a01, a02, v01, v11, v21, v02, v12, v22);
    }
    eval3[idx * 3 + 0] = a00; eval3[idx * 3 + 1] = a11; eval3[idx * 3 + 2] = a22;
    float* q = evec9 + idx * 9;
    q[0]=v00; q[1]=v01; q[2]=v02; q[3]=v10; q[4]=v11; q[5]=v12; q[6]=v20; q[7]=v21; q[8]=v22;
}

KernelStatus launch_batched_eigen3x3(const float* d_sym6, float* d_eval3, float* d_evec9, const BatchEigenConfig& cfg, cudaStream_t stream) {
    KernelStatus st = validate_eigen3x3_cfg(cfg);
    if (st != KernelStatus::Ok) return st;
    int blocks = (cfg.count + 255) / 256;
    eigen3x3_kernel<<<blocks, 256, 0, stream>>>(d_sym6, d_eval3, d_evec9, cfg.count, cfg.max_sweeps);
    return check_cuda(cudaGetLastError(), "eigen3x3_kernel");
}
