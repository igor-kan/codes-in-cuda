/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for 2D Acoustic Wave Propagation Stencil with Shared Halo.
 * Module: stencil_2d_wave_equation
 */

typedef enum stencil_2d_wave_equation_error_code {
    STENCIL_2D_WAVE_EQUATION_STATUS_OK = 0,
    STENCIL_2D_WAVE_EQUATION_ERR_NULL_PTR = -20,
    STENCIL_2D_WAVE_EQUATION_ERR_OUT_OF_BOUNDS = -21,
    STENCIL_2D_WAVE_EQUATION_ERR_DIVERGENCE = -22
} stencil_2d_wave_equation_error_code_t;

const char* stencil_2d_wave_equation_error_message(stencil_2d_wave_equation_error_code_t code) {
    switch (code) {
        case STENCIL_2D_WAVE_EQUATION_STATUS_OK: return "Operational success";
        case STENCIL_2D_WAVE_EQUATION_ERR_NULL_PTR: return "Null pointer argument";
        case STENCIL_2D_WAVE_EQUATION_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case STENCIL_2D_WAVE_EQUATION_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
