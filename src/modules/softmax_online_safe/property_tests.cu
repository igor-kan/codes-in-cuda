#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_softmax_online_safe;
    assert(validate_softmax_cfg({0, 128}) != 0);
    assert(validate_softmax_cfg({16, 0}) != 0);
    assert(validate_softmax_cfg({64, 4096}) == 0);
    return 0;
}
