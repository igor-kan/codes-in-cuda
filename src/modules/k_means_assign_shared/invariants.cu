#include "interface.cuh"
#include <cmath>
#include <limits>

KernelStatus verify_kmeans_assign(const float* h_pts, const float* h_centroids, const int* h_labels, const KMeansConfig& cfg) {
    for (int i = 0; i < cfg.n_points; ++i) {
        int lbl = h_labels[i];
        if (lbl < 0 || lbl >= cfg.k_clusters) return KernelStatus::InvariantMismatch;
        double best_d = std::numeric_limits<double>::infinity();
        int best_c = 0;
        for (int c = 0; c < cfg.k_clusters; ++c) {
            double d2 = 0.0;
            for (int d = 0; d < cfg.dims; ++d) {
                double diff = h_pts[static_cast<size_t>(i) * cfg.dims + d] - h_centroids[static_cast<size_t>(c) * cfg.dims + d];
                d2 += diff * diff;
            }
            if (d2 < best_d) { best_d = d2; best_c = c; }
        }
        if (best_c != lbl) return KernelStatus::InvariantMismatch;
    }
    return KernelStatus::Ok;
}
