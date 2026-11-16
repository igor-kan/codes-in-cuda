#include "interface.cuh"

KernelStatus launch_trsv_streams(const float* const* us, const float* const* bs, float* const* xs, int n_streams, const Trsv32Config& cfg, cudaStream_t* streams) {
    if (!us || !bs || !xs || !streams || n_streams <= 0) return KernelStatus::InvalidGrid;
    for (int i = 0; i < n_streams; ++i) {
        KernelStatus st = launch_trsv32_warp(us[i], bs[i], xs[i], cfg, streams[i]);
        if (st != KernelStatus::Ok) return st;
    }
    return KernelStatus::Ok;
}
