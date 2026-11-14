/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction
 */

typedef enum stencil_2d_heat_conduction_error_status {
    STENCIL_2D_HEAT_CONDUCTION_OK = 0,
    STENCIL_2D_HEAT_CONDUCTION_ERR_INVALID_PARAM = -10,
    STENCIL_2D_HEAT_CONDUCTION_ERR_CAPACITY_LIMIT = -11,
    STENCIL_2D_HEAT_CONDUCTION_ERR_NUMERICAL_FAULT = -12
} stencil_2d_heat_conduction_error_status_t;

const char* stencil_2d_heat_conduction_error_string(stencil_2d_heat_conduction_error_status_t err) {
    switch (err) {
        case STENCIL_2D_HEAT_CONDUCTION_OK: return "Operational success";
        case STENCIL_2D_HEAT_CONDUCTION_ERR_INVALID_PARAM: return "Parameter domain precondition violated";
        case STENCIL_2D_HEAT_CONDUCTION_ERR_CAPACITY_LIMIT: return "Buffer capacity boundary reached";
        case STENCIL_2D_HEAT_CONDUCTION_ERR_NUMERICAL_FAULT: return "Numerical computation anomaly";
        default: return "Unknown module error code";
    }
}
