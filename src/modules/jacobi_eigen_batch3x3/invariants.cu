#include "interface.cuh"
#include <cmath>

KernelStatus verify_eigen3x3_parity(const float* h_sym6, const float* h_eval3, const float* h_evec9, int count, float tol) {
    for (int idx = 0; idx < count; ++idx) {
        const float* s = h_sym6 + idx * 6;
        const float* l = h_eval3 + idx * 3;
        const float* q = h_evec9 + idx * 9;
        float tr_a = s[0] + s[3] + s[5];
        float tr_l = l[0] + l[1] + l[2];
        if (std::fabs(tr_a - tr_l) > tol) return KernelStatus::InvariantMismatch;
        float r00 = l[0]*q[0]*q[0] + l[1]*q[1]*q[1] + l[2]*q[2]*q[2];
        if (std::fabs(r00 - s[0]) > tol) return KernelStatus::InvariantMismatch;
    }
    return KernelStatus::Ok;
}
