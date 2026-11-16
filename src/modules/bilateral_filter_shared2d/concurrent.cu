#include "interface.cuh"

KernelStatus launch_bilateral_batch(const float* const* ins, float* const* outs, int n_frames, const BilateralConfig& cfg, cudaStream_t* streams) {
    if (!ins || !outs || !streams || n_frames <= 0) return KernelStatus::InvalidGrid;
    for (int i = 0; i < n_frames; ++i) {
        KernelStatus st = launch_bilateral_shared(ins[i], outs[i], cfg, streams[i]);
        if (st != KernelStatus::Ok) return st;
    }
    return KernelStatus::Ok;
}
