#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    std::vector<float> grad(16 * 16);
    for (int y = 0; y < 16; ++y)
        for (int x = 0; x < 16; ++x) grad[y * 16 + x] = static_cast<float>(x);
    assert(verify_isoline_cpu(grad.data(), 16, 16, 7.5f, 15) == KernelStatus::Ok);
    return 0;
}
