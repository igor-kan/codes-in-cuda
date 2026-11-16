#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    IsolineConfig cfg{4, 4, 0.5f};
    assert(validate_isoline_cfg(cfg) == KernelStatus::Ok);
    std::vector<float> flat(16, 1.0f);
    assert(verify_isoline_cpu(flat.data(), 4, 4, 0.5f, 0) == KernelStatus::Ok);
    flat[5] = 0.0f;
    assert(verify_isoline_cpu(flat.data(), 4, 4, 0.5f, 4) == KernelStatus::Ok);
    return 0;
}
