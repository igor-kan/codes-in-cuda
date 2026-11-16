#include "interface.cuh"
#include <algorithm>
#include <cmath>

KernelStatus verify_bilateral_parity(const float* h_in, const float* h_out, const BilateralConfig& cfg, float tol) {
    for (int y = 0; y < cfg.height; ++y) {
        for (int x = 0; x < cfg.width; ++x) {
            double c = h_in[y * cfg.width + x];
            double ws = 0.0, acc = 0.0;
            for (int dy = -cfg.radius; dy <= cfg.radius; ++dy) {
                int yy = std::min(std::max(y + dy, 0), cfg.height - 1);
                for (int dx = -cfg.radius; dx <= cfg.radius; ++dx) {
                    int xx = std::min(std::max(x + dx, 0), cfg.width - 1);
                    double v = h_in[yy * cfg.width + xx];
                    double dr = v - c;
                    double w = std::exp(-(dx * dx + dy * dy) * cfg.inv_two_sigma_s2 - dr * dr * cfg.inv_two_sigma_r2);
                    ws += w;
                    acc += w * v;
                }
            }
            if (std::fabs((acc / ws) - h_out[y * cfg.width + x]) > tol) return KernelStatus::InvariantMismatch;
        }
    }
    return KernelStatus::Ok;
}
