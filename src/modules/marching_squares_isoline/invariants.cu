#include "interface.cuh"

KernelStatus verify_isoline_cpu(const float* h_field, int width, int height, float iso, int expected_cells) {
    int active = 0;
    for (int cy = 0; cy < height - 1; ++cy) {
        for (int cx = 0; cx < width - 1; ++cx) {
            int m = 0;
            if (h_field[cy * width + cx] >= iso) m |= 1;
            if (h_field[cy * width + (cx + 1)] >= iso) m |= 2;
            if (h_field[(cy + 1) * width + (cx + 1)] >= iso) m |= 4;
            if (h_field[(cy + 1) * width + cx] >= iso) m |= 8;
            if (m != 0 && m != 15) ++active;
        }
    }
    return (active == expected_cells) ? KernelStatus::Ok : KernelStatus::InvariantMismatch;
}
