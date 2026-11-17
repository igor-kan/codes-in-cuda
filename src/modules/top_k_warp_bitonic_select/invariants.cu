#include "interface.cuh"
#include <cassert>
namespace cu_top_k_warp_bitonic_select {
void verify_descending_host(const float* out, int rows, int k) {
    for (int r = 0; r < rows; ++r)
        for (int j = 1; j < k; ++j) assert(out[r * k + j - 1] >= out[r * k + j]);
}
} // namespace cu_top_k_warp_bitonic_select