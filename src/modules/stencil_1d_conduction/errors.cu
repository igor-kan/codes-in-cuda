/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction
 */

typedef enum stencil_1d_conduction_error {
    STENCIL_1D_CONDUCTION_SUCCESS = 0,
    STENCIL_1D_CONDUCTION_ERR_INVALID_INPUT = -1,
    STENCIL_1D_CONDUCTION_ERR_BUFFER_OVERFLOW = -2,
    STENCIL_1D_CONDUCTION_ERR_CONVERGENCE_FAIL = -3
} stencil_1d_conduction_error_t;

const char* stencil_1d_conduction_str_error(stencil_1d_conduction_error_t code) {
    switch (code) {
        case STENCIL_1D_CONDUCTION_SUCCESS: return "Operation completed successfully";
        case STENCIL_1D_CONDUCTION_ERR_INVALID_INPUT: return "Input argument violates domain preconditions";
        case STENCIL_1D_CONDUCTION_ERR_BUFFER_OVERFLOW: return "Output buffer capacity exceeded";
        case STENCIL_1D_CONDUCTION_ERR_CONVERGENCE_FAIL: return "Numerical algorithm failed to converge within limit";
        default: return "Unrecognized error code";
    }
}
