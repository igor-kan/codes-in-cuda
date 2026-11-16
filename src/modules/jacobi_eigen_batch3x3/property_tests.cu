#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    BatchEigenConfig cfg{128, 20, 1e-6f};
    assert(validate_eigen3x3_cfg(cfg) == KernelStatus::Ok);
    assert(eigen3x3_bytes_required(128) == 128U * 18U * 4U);
    return 0;
}
