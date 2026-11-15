#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_morton_zorder_bvh;
    assert(validate_morton_bounds(1) != 0);
    assert(validate_morton_bounds(64) == 0);
    return 0;
}
