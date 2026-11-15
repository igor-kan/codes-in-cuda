#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_rope_rotary_embedding;
    assert(validate_rope_config({8, 2, 31, 10000.0f, 0}) == -2);
    assert(validate_rope_config({8, 2, 32, 0.5f, 0}) == -3);
    assert(validate_rope_config({8, 2, 64, 500000.0f, 128}) == 0);
    return 0;
}
