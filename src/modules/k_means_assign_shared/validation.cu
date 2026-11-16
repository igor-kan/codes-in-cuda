#include "interface.cuh"

KernelStatus validate_kmeans(const KMeansConfig& cfg) {
    if (cfg.n_points <= 0 || cfg.k_clusters <= 0 || cfg.dims <= 0) return KernelStatus::InvalidDimension;
    return KernelStatus::Ok;
}
