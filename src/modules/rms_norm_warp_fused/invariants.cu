#include "interface.cuh"
#include <cmath>

KernelStatus verify_rms_cpu_parity(const float* h_x, const float* h_gamma, const float* h_y, const RmsNormConfig& cfg, float tol) {
    for (int r = 0; r < cfg.rows; ++r) {
        double ss = 0.0;
        for (int c = 0; c < cfg.hidden_dim; ++c) {
            double v = h_x[static_cast<size_t>(r) * cfg.hidden_dim + c];
            ss += v * v;
        }
        double inv = 1.0 / std::sqrt(ss / cfg.hidden_dim + cfg.eps);
        for (int c = 0; c < cfg.hidden_dim; ++c) {
            double exp_y = h_x[static_cast<size_t>(r) * cfg.hidden_dim + c] * inv * h_gamma[c];
            if (std::fabs(exp_y - h_y[static_cast<size_t>(r) * cfg.hidden_dim + c]) > tol) {
                return KernelStatus::InvariantMismatch;
            }
        }
    }
    return KernelStatus::Ok;
}
