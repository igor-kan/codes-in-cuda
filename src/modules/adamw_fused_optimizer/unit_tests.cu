#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_adamw_fused_optimizer;
    AdamWConfig cfg{1e-3f, 0.9f, 0.999f, 1e-8f, 0.01f, 1, 1024};
    assert(validate_adamw_cfg(cfg) == 0);
    float hv[4] = {0.0f, 1e-6f, 0.25f, 1.5f};
    assert(verify_second_moment_nonneg(hv, 4) == 0);
    return 0;
}
