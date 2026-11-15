#include "interface.cuh"
#include <cassert>
#include <cmath>
#include <vector>

int main() {
    using namespace cu_flash_attention_tiled;
    FlashAttnConfig cfg{32, 16, 0.25f, 1};
    assert(validate_flash_cfg(cfg) == 0);
    std::vector<float> q(32 * 16, 0.1f), k(32 * 16, 0.2f), v(32 * 16, 0.5f), o(32 * 16, 0.0f);
    float *dq, *dk, *dv, *do_ptr;
    cudaMalloc(&dq, q.size() * sizeof(float));
    cudaMalloc(&dk, k.size() * sizeof(float));
    cudaMalloc(&dv, v.size() * sizeof(float));
    cudaMalloc(&do_ptr, o.size() * sizeof(float));
    cudaMemcpy(dq, q.data(), q.size() * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(dk, k.data(), k.size() * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(dv, v.data(), v.size() * sizeof(float), cudaMemcpyHostToDevice);
    launch_flash_attention_fwd(dq, dk, dv, do_ptr, cfg, 0);
    cudaMemcpy(o.data(), do_ptr, o.size() * sizeof(float), cudaMemcpyDeviceToHost);
    auto st = verify_attention_against_cpu(q.data(), k.data(), v.data(), o.data(), cfg);
    assert(st.max_abs_err < 1e-4f);
    cudaFree(dq); cudaFree(dk); cudaFree(dv); cudaFree(do_ptr);
    return 0;
}
