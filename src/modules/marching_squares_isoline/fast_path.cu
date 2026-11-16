#include "interface.cuh"

__global__ void ms_emit_kernel(const float* __restrict__ f, const int* __restrict__ offs, SegVertex2D* __restrict__ segs, IsolineConfig cfg) {
    int cx = blockIdx.x * blockDim.x + threadIdx.x;
    int cy = blockIdx.y * blockDim.y + threadIdx.y;
    int cw = cfg.width - 1, ch = cfg.height - 1;
    if (cx >= cw || cy >= ch) return;
    float v0 = f[cy * cfg.width + cx];
    float v1 = f[cy * cfg.width + (cx + 1)];
    float v2 = f[(cy + 1) * cfg.width + (cx + 1)];
    float v3 = f[(cy + 1) * cfg.width + cx];
    int mask = (v0 >= cfg.iso_level ? 1 : 0) | (v1 >= cfg.iso_level ? 2 : 0) |
               (v2 >= cfg.iso_level ? 4 : 0) | (v3 >= cfg.iso_level ? 8 : 0);
    if (mask == 0 || mask == 15) return;
    int out_idx = offs[cy * cw + cx];
    float tx = (fabsf(v1 - v0) > 1e-8f) ? (cfg.iso_level - v0) / (v1 - v0) : 0.5f;
    float ty = (fabsf(v3 - v0) > 1e-8f) ? (cfg.iso_level - v0) / (v3 - v0) : 0.5f;
    segs[out_idx] = SegVertex2D{static_cast<float>(cx) + tx, static_cast<float>(cy),
                                static_cast<float>(cx), static_cast<float>(cy) + ty};
}

KernelStatus launch_marching_squares_emit(const float* d_field, const int* d_offsets, SegVertex2D* d_segs, const IsolineConfig& cfg, cudaStream_t stream) {
    KernelStatus st = validate_isoline_cfg(cfg);
    if (st != KernelStatus::Ok) return st;
    dim3 block(16, 16);
    dim3 grid((cfg.width + 14) / 16, (cfg.height + 14) / 16);
    ms_emit_kernel<<<grid, block, 0, stream>>>(d_field, d_offsets, d_segs, cfg);
    return check_cuda(cudaGetLastError(), "ms_emit_kernel");
}
