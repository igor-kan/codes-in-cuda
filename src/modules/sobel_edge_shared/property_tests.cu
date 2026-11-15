#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_sobel_edge_shared;
    assert(validate_image_spec({2, 32}) != 0);
    assert(validate_image_spec({1920, 1080}) == 0);
    return 0;
}
