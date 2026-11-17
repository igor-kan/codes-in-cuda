#include "interface.cuh"
namespace cu_box_blur_separable_cuda {
__device__ __forceinline__ int clamp_coord(int c, int hi) {
    if (c < 0) return 0;
    if (c >= hi) return hi - 1;
    return c;
}
} // namespace cu_box_blur_separable_cuda