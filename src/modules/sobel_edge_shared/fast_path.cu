#include "interface.cuh"

namespace cu_sobel_edge_shared {
// Hardware hypotf ensures overflow-free Sobel magnitude evaluation
__host__ __device__ inline float sobel_l1_approx(float dx_g, float dy_g) {
    return fabsf(dx_g) + fabsf(dy_g);
}
} // namespace cu_sobel_edge_shared
