#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    using namespace cu_sobel_edge_shared;
    ImageSpec spec{32, 32};
    assert(validate_image_spec(spec) == 0);
    std::vector<float> hin(1024, 0.42f), hout(1024, 1.0f);
    float *din, *dout;
    cudaMalloc(&din, 1024 * sizeof(float));
    cudaMalloc(&dout, 1024 * sizeof(float));
    cudaMemcpy(din, hin.data(), 1024 * sizeof(float), cudaMemcpyHostToDevice);
    launch_sobel_shared(din, dout, spec, 0);
    cudaMemcpy(hout.data(), dout, 1024 * sizeof(float), cudaMemcpyDeviceToHost);
    assert(verify_uniform_image_zero_edge(hout.data(), spec) < 1e-6f);
    cudaFree(din); cudaFree(dout);
    return 0;
}
