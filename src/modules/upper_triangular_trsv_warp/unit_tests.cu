#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    Trsv32Config cfg{4, 1.0f};
    assert(validate_trsv32(cfg) == KernelStatus::Ok);
    std::vector<float> hu(4 * 1024, 0.0f), hb(4 * 32, 2.0f), hx(4 * 32, 1.0f);
    for (int m = 0; m < 4; ++m) for (int r = 0; r < 32; ++r) hu[m * 1024 + r * 32 + r] = 2.0f;
    assert(verify_trsv32_cpu(hu.data(), hb.data(), hx.data(), 4, 1e-6f) == KernelStatus::Ok);
    return 0;
}
