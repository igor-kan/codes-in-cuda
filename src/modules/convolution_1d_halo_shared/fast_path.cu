#include "interface.cuh"
namespace cu_convolution_1d_halo_shared {
__device__ __forceinline__ float fir_tap_accumulate(float acc, float sample, float weight) {
    return fmaf(sample, weight, acc);
}
} // namespace cu_convolution_1d_halo_shared