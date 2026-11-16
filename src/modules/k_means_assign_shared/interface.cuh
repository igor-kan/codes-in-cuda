#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_k_means_assign_shared {
KernelStatus launch_kmeans_assign(const float* d_pts, const float* d_centroids, int* d_labels, float* d_new_centroids, int* d_counts, const KMeansConfig& cfg, cudaStream_t stream);
KernelStatus validate_kmeans(const KMeansConfig& cfg);
KernelStatus verify_kmeans_assign(const float* h_pts, const float* h_centroids, const int* h_labels, const KMeansConfig& cfg);
} // namespace cu_k_means_assign_shared
