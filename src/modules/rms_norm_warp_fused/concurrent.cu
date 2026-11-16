#include "interface.cuh"

KernelStatus launch_rms_norm_multistream(const float* const* xs, const float* d_gamma, float* const* ys, int n_chunks, const RmsNormConfig& cfg, cudaStream_t* streams) {
    if (!xs || !ys || !streams || n_chunks <= 0) return KernelStatus::InvalidGrid;
    for (int i = 0; i < n_chunks; ++i) {
        KernelStatus st = launch_rms_norm_vec4(xs[i], d_gamma, ys[i], cfg, streams[i]);
        if (st != KernelStatus::Ok) return st;
    }
    return KernelStatus::Ok;
}
