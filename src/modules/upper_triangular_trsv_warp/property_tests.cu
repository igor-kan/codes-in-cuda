#include "interface.cuh"
#include <cassert>

int main() {
    assert(trsv32_workspace_bytes(16) == 16U * 1088U * 4U);
    Trsv32Config bad{0, 0.0f};
    assert(validate_trsv32(bad) == KernelStatus::InvalidDimension);
    return 0;
}
