#include "interface.cuh"
#include <cfloat>

__global__ void kmeans_shared_tile_kernel(const float* __restrict__ pts, const float* __restrict__ centroids,
                                          int* __restrict__ labels, KMeansConfig cfg) {
    extern __shared__ float s_cent[];
    int tid = threadIdx.x;
    int total_c = cfg.k_clusters * cfg.dims;
    for (int idx = tid; idx < total_c; idx += blockDim.x) s_cent[idx] = centroids[idx];
    __syncthreads();

    int i = blockIdx.x * blockDim.x + tid;
    if (i >= cfg.n_points) return;
    const float* p = pts + static_cast<size_t>(i) * cfg.dims;
    float best_d = FLT_MAX;
    int best_c = 0;
    for (int c = 0; c < cfg.k_clusters; ++c) {
        float d2 = 0.0f;
        for (int d = 0; d < cfg.dims; ++d) {
            float diff = p[d] - s_cent[c * cfg.dims + d];
            d2 += diff * diff;
        }
        if (d2 < best_d) { best_d = d2; best_c = c; }
    }
    labels[i] = best_c;
}
