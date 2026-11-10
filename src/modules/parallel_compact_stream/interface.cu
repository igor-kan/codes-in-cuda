/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for Stream Compaction and Filtering via Parallel Scan.
 * Module: parallel_compact_stream
 */

#ifndef PARALLEL_COMPACT_STREAM_INTERFACE_H
#define PARALLEL_COMPACT_STREAM_INTERFACE_H

#include "types.cu"

typedef int (*parallel_compact_stream_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct parallel_compact_stream_vtable {
    int (*init)(parallel_compact_stream_state_t* state, const parallel_compact_stream_config_t* cfg);
    int (*execute)(parallel_compact_stream_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(parallel_compact_stream_state_t* state);
    int (*destroy)(parallel_compact_stream_state_t* state);
} parallel_compact_stream_vtable_t;

#endif /* PARALLEL_COMPACT_STREAM_INTERFACE_H */
