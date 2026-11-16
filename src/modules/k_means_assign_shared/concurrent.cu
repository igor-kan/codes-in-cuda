#include "interface.cuh"

KernelStatus launch_kmeans_steps(const float* d_pts, const float* d_c0, int* d_lbl, float* d_sum, int* d_cnt, int steps, const KMeansConfig& cfg, cudaStream_t stream) {
    for (int s = 0; s < steps; ++s) {
        KernelStatus st = launch_kmeans_assign(d_pts, d_c0, d_lbl, d_sum, d_cnt, cfg, stream);
        if (st != KernelStatus::Ok) return st;
    }
    return KernelStatus::Ok;
}
