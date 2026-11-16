#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    BatchEigenConfig cfg{4, 15, 1e-6f};
    std::vector<float> h_sym(4 * 6), h_val(12), h_vec(36);
    for (int i = 0; i < 4; ++i) {
        h_sym[i*6+0] = 4.0f + i; h_sym[i*6+1] = 1.0f; h_sym[i*6+2] = 0.5f;
        h_sym[i*6+3] = 3.0f;     h_sym[i*6+4] = 0.2f; h_sym[i*6+5] = 2.0f;
    }
    float *ds=nullptr, *dv=nullptr, *dq=nullptr;
    cudaMalloc(&ds, h_sym.size()*4); cudaMalloc(&dv, h_val.size()*4); cudaMalloc(&dq, h_vec.size()*4);
    cudaMemcpy(ds, h_sym.data(), h_sym.size()*4, cudaMemcpyHostToDevice);
    assert(launch_batched_eigen3x3(ds, dv, dq, cfg, 0) == KernelStatus::Ok);
    cudaMemcpy(h_val.data(), dv, h_val.size()*4, cudaMemcpyDeviceToHost);
    cudaMemcpy(h_vec.data(), dq, h_vec.size()*4, cudaMemcpyDeviceToHost);
    assert(verify_eigen3x3_parity(h_sym.data(), h_val.data(), h_vec.data(), 4, 1e-4f) == KernelStatus::Ok);
    cudaFree(ds); cudaFree(dv); cudaFree(dq);
    return 0;
}
