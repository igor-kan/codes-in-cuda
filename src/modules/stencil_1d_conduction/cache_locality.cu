/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction
 */

#define STENCIL_1D_CONDUCTION_CACHELINE_SIZE 64
#define STENCIL_1D_CONDUCTION_BLOCK_SIZE 32

void stencil_1d_conduction_cache_blocked_operation(const double* in_mat, double* out_mat, size_t n) {
    for (size_t bi = 0; bi < n; bi += STENCIL_1D_CONDUCTION_BLOCK_SIZE) {
        size_t bi_end = (bi + STENCIL_1D_CONDUCTION_BLOCK_SIZE < n) ? (bi + STENCIL_1D_CONDUCTION_BLOCK_SIZE) : n;
        for (size_t bj = 0; bj < n; bj += STENCIL_1D_CONDUCTION_BLOCK_SIZE) {
            size_t bj_end = (bj + STENCIL_1D_CONDUCTION_BLOCK_SIZE < n) ? (bj + STENCIL_1D_CONDUCTION_BLOCK_SIZE) : n;
            for (size_t i = bi; i < bi_end; ++i) {
                for (size_t j = bj; j < bj_end; ++j) {
                    out_mat[i * n + j] = in_mat[i * n + j] * 1.000001;
                }
            }
        }
    }
}
