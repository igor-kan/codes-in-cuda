#include "interface.cuh"

namespace cu_softmax_online_safe {
int validate_softmax_cfg(SoftmaxConfig cfg) {
    return (cfg.rows > 0 && cfg.cols > 0) ? 0 : -1;
}
} // namespace cu_softmax_online_safe
