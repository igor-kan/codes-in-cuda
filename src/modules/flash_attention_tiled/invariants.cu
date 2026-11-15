#include "interface.cuh"
#include <cmath>
#include <vector>

namespace cu_flash_attention_tiled {
FlashAttnStats verify_attention_against_cpu(
    const float* h_q, const float* h_k, const float* h_v, const float* h_o,
    FlashAttnConfig cfg) {
    int N = cfg.seq_len;
    int d = cfg.head_dim;
    float max_err = 0.0f;
    float sum = 0.0f;
    std::vector<double> scores(N);
    for (int i = 0; i < N; ++i) {
        double m = -1e300;
        for (int j = 0; j < N; ++j) {
            if (cfg.causal_mask && j > i) { scores[j] = -1e300; continue; }
            double dot = 0.0;
            for (int c = 0; c < d; ++c) dot += static_cast<double>(h_q[i * d + c]) * h_k[j * d + c];
            scores[j] = dot * cfg.scale;
            if (scores[j] > m) m = scores[j];
        }
        double z = 0.0;
        for (int j = 0; j < N; ++j) { scores[j] = (scores[j] < -1e100) ? 0.0 : std::exp(scores[j] - m); z += scores[j]; }
        for (int c = 0; c < d; ++c) {
            double ref = 0.0;
            for (int j = 0; j < N; ++j) ref += (scores[j] / z) * h_v[j * d + c];
            float err = std::fabs(h_o[i * d + c] - static_cast<float>(ref));
            if (err > max_err) max_err = err;
            sum += h_o[i * d + c];
        }
    }
    return {max_err, sum};
}
} // namespace cu_flash_attention_tiled
