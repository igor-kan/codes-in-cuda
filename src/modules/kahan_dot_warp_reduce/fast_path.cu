#include "interface.cuh"
#include <cmath>
namespace cu_kahan_dot_warp_reduce {
__device__ __forceinline__ void neumaier_step(float& s, float& c, float x) {
    float t = s + x;
    c += (std::fabs(s) >= std::fabs(x)) ? ((s - t) + x) : ((x - t) + s);
    s = t;
}
} // namespace cu_kahan_dot_warp_reduce