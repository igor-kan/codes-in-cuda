/**
 * @file concurrency.cu
 * @brief Thread safety and reentrancy model for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#include <stdint.h>
#include <stdbool.h>

typedef struct conv2d_im2col_gemm_atomic_counter {
    volatile uint64_t value;
} conv2d_im2col_gemm_atomic_counter_t;

static inline void conv2d_im2col_gemm_counter_inc(conv2d_im2col_gemm_atomic_counter_t* c) {
    __atomic_fetch_add(&c->value, 1, __ATOMIC_RELAXED);
}
