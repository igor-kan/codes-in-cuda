#include "interface.cuh"

__device__ __forceinline__ float lerp_edge(float v0, float v1, float iso) {
    float denom = v1 - v0;
    return (fabsf(denom) < 1e-8f) ? 0.5f : ((iso - v0) / denom);
}

__global__ void ms_classify_kernel(const float* __restrict__ f, int* __restrict__ cases, int* __restrict__ counts, IsolineConfig cfg) {
    int cx = blockIdx.x * blockDim.x + threadIdx.x;
    int cy = blockIdx.y * blockDim.y + threadIdx.y;
    int cw = cfg.width - 1, ch = cfg.height - 1;
    if (cx >= cw || cy >= ch) return;
    int mask = 0;
    if (f[cy * cfg.width + cx] >= cfg.iso_level) mask |= 1;
    if (f[cy * cfg.width + (cx + 1)] >= cfg.iso_level) mask |= 2;
    if (f[(cy + 1) * cfg.width + (cx + 1)] >= cfg.iso_level) mask |= 4;
    if (f[(cy + 1) * cfg.width + cx] >= cfg.iso_level) mask |= 8;
    int cid = cy * cw + cx;
    cases[cid] = mask;
    counts[cid] = (mask == 0 || mask == 15) ? 0 : ((mask == 5 || mask == 10) ? 2 : 1);
}

KernelStatus launch_marching_squares_classify(const float* d_field, int* d_cell_cases, int* d_seg_counts, const IsolineConfig& cfg, cudaStream_t stream) {
    KernelStatus st = validate_isoline_cfg(cfg);
    if (st != KernelStatus::Ok) return st;
    dim3 block(16, 16);
    dim3 grid((cfg.width + 14) / 16, (cfg.height + 14) / 16);
    ms_classify_kernel<<<grid, block, 0, stream>>>(d_field, d_cell_cases, d_seg_counts, cfg);
    return check_cuda(cudaGetLastError(), "ms_classify_kernel");
}
