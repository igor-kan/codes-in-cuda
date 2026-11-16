#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_marching_squares_isoline {
constexpr int WARP_SIZE = 32;
struct IsolineConfig {
    int width;
    int height;
    float iso_level;
};

struct SegVertex2D {
    float x0, y0, x1, y1;
};
} // namespace cu_marching_squares_isoline
