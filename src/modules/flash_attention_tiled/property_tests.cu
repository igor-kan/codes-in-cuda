#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_flash_attention_tiled;
    assert(validate_flash_cfg({0, 16, 0.25f, 0}) != 0);
    assert(validate_flash_cfg({16, 128, 0.25f, 0}) != 0);
    assert(validate_flash_cfg({16, 32, -1.0f, 0}) != 0);
    assert(validate_flash_cfg({64, 64, 0.125f, 1}) == 0);
    return 0;
}
