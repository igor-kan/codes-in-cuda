#include "interface.cuh"

KernelStatus launch_isoline_batch(const float* const* fields, int* const* cases, int* const* counts, int n_slices, const IsolineConfig& cfg, cudaStream_t* streams) {
    if (!fields || !cases || !counts || !streams || n_slices <= 0) return KernelStatus::InvalidGrid;
    for (int i = 0; i < n_slices; ++i) {
        KernelStatus st = launch_marching_squares_classify(fields[i], cases[i], counts[i], cfg, streams[i]);
        if (st != KernelStatus::Ok) return st;
    }
    return KernelStatus::Ok;
}
