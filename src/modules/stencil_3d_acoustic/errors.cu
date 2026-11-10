/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for 3D 25-Point High-Order Acoustic Wave Stencil.
 * Module: stencil_3d_acoustic
 */

typedef enum stencil_3d_acoustic_error_code {
    STENCIL_3D_ACOUSTIC_STATUS_OK = 0,
    STENCIL_3D_ACOUSTIC_ERR_NULL_PTR = -10,
    STENCIL_3D_ACOUSTIC_ERR_OUT_OF_BOUNDS = -11,
    STENCIL_3D_ACOUSTIC_ERR_DIVERGENCE = -12
} stencil_3d_acoustic_error_code_t;

const char* stencil_3d_acoustic_error_message(stencil_3d_acoustic_error_code_t code) {
    switch (code) {
        case STENCIL_3D_ACOUSTIC_STATUS_OK: return "Operational success";
        case STENCIL_3D_ACOUSTIC_ERR_NULL_PTR: return "Null pointer argument";
        case STENCIL_3D_ACOUSTIC_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case STENCIL_3D_ACOUSTIC_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
