#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    KMeansConfig cfg{16, 2, 2};
    std::vector<float> pts = {0,0, 1,0, 10,10, 11,10};
    pts.resize(32, 10.0f);
    std::vector<float> cen = {0,0, 10,10};
    std::vector<int> lbl(16, 1);
    lbl[0] = 0; lbl[1] = 0;
    assert(verify_kmeans_assign(pts.data(), cen.data(), lbl.data(), cfg) == KernelStatus::Ok);
    return 0;
}
