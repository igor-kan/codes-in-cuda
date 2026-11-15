#include "interface.cuh"

namespace cu_flash_attention_tiled {
void launch_flash_attention_streams(
    const float** d_q_heads, const float** d_k_heads, const float** d_v_heads,
    float** d_o_heads, int num_heads, FlashAttnConfig cfg, cudaStream_t* streams) {
    for (int h = 0; h < num_heads; ++h) {
        cudaStream_t st = streams ? streams[h] : 0;
        launch_flash_attention_fwd(d_q_heads[h], d_k_heads[h], d_v_heads[h], d_o_heads[h], cfg, st);
    }
}
} // namespace cu_flash_attention_tiled
