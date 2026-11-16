#include "interface.cuh"
#include <cfloat>

__global__ void kmeans_assign_accum_kernel(const float* __restrict__ pts, const float* __restrict__ centroids,
                                           int* __restrict__ labels, float* __restrict__ sums, int* __restrict__ counts,
                                           KMeansConfig cfg) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= cfg.n_points) return;
    const float* p = pts + static_cast<size_t>(i) * cfg.dims;
    float best_d = FLT_MAX;
    int best_c = 0;
    for (int c = 0; c < cfg.k_clusters; ++c) {
        const float* mu = centroids + static_cast<size_t>(c) * cfg.dims;
        float d2 = 0.0f;
        for (int d = 0; d < cfg.dims; ++d) {
            float diff = p[d] - mu[d];
            d2 += diff * diff;
        }
        if (d2 < best_d) { best_d = d2; best_c = c; }
    }
    labels[i] = best_c;
    atomicAdd(&counts[best_c], 1);
    for (int d = 0; d < cfg.dims; ++d) {
        atomicAdd(&sums[static_cast<size_t>(best_c) * cfg.dims + d], p[d]);
    }
}

KernelStatus launch_kmeans_assign(const float* d_pts, const float* d_centroids, int* d_labels, float* d_new_centroids, int* d_counts, const KMeansConfig& cfg, cudaStream_t stream) {
    KernelStatus st = validate_kmeans(cfg);
    if (st != KernelStatus::Ok) return st;
    cudaMemsetAsync(d_new_centroids, 0, static_cast<size_t>(cfg.k_clusters) * cfg.dims * sizeof(float), stream);
    cudaMemsetAsync(d_counts, 0, static_cast<size_t>(cfg.k_clusters) * sizeof(int), stream);
    int blocks = (cfg.n_points + 255) / 256;
    kmeans_assign_accum_kernel<<<blocks, 256, 0, stream>>>(d_pts, d_centroids, d_labels, d_new_centroids, d_counts, cfg);
    return check_cuda(cudaGetLastError(), "kmeans_assign_accum_kernel");
}
