#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    KMeansConfig cfg{64, 4, 8};
    assert(validate_kmeans(cfg) == KernelStatus::Ok);
    std::vector<float> hpts(64 * 8, 1.0f), hcen(4 * 8, 0.0f);
    std::vector<int> hlbl(64, -1);
    assert(hpts.size() == 512 && hcen.size() == 32 && hlbl[0] == -1);
    return 0;
}
