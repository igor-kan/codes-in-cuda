#include "interface.cuh"

namespace cu_sobel_edge_shared {
int validate_image_spec(ImageSpec spec) {
    return (spec.width >= 3 && spec.height >= 3) ? 0 : -1;
}
} // namespace cu_sobel_edge_shared
