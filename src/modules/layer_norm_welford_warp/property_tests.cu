#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_layer_norm_welford_warp;
    assert(validate_layernorm_params({0, 128, 1e-5f}) != 0);
    assert(validate_layernorm_params({8, 128, 0.0f}) != 0);
    assert(validate_layernorm_params({8, 1024, 1e-6f}) == 0);
    return 0;
}
