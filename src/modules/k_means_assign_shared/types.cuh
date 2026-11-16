#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_k_means_assign_shared {
constexpr int WARP_SIZE = 32;
struct KMeansConfig {
    int n_points;
    int k_clusters;
    int dims;
};
} // namespace cu_k_means_assign_shared
