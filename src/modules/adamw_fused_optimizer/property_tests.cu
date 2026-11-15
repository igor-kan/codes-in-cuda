#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_adamw_fused_optimizer;
    assert(validate_adamw_cfg({1e-3f, 0.9f, 0.999f, 1e-8f, 0.0f, 0, 128}) == -3);
    assert(validate_adamw_cfg({1e-3f, 1.0f, 0.999f, 1e-8f, 0.0f, 1, 128}) == -1);
    return 0;
}
