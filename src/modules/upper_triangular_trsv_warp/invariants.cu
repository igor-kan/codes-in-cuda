#include "interface.cuh"
#include <cmath>

KernelStatus verify_trsv32_cpu(const float* h_u, const float* h_rhs, const float* h_x, int batch, float tol) {
    for (int m = 0; m < batch; ++m) {
        const float* u = h_u + m * 1024;
        const float* b = h_rhs + m * 32;
        const float* x = h_x + m * 32;
        for (int r = 0; r < 32; ++r) {
            double acc = 0.0;
            for (int c = r; c < 32; ++c) acc += u[r * 32 + c] * x[c];
            if (std::fabs(acc - b[r]) > tol) return KernelStatus::InvariantMismatch;
        }
    }
    return KernelStatus::Ok;
}
