# Grid-Stride Scalar-Alpha Vector AXPY Kernel (`saxpy_grid_stride_d57`)

> Category: **BLAS Level-1 GPU** | Language: **CUDA C++**

## Overview

Computes d_out[i] = alpha * d_in[i] + d_out[i] across arbitrarily sized global buffers using portable grid-stride index loops.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / G) grid-stride memory bound` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Zero alpha leaves destination array unchanged cleanly across every thread.

## Module Architecture

| File | Lifecycle Role |
| :--- | :--- |
| `types.cuh` | Stage 01 |
| `errors.cuh` | Stage 02 |
| `interface.cuh` | Stage 03 |
| `core.cu` | Stage 04 |
| `validation.cu` | Stage 05 |
| `fast_path.cu` | Stage 06 |
| `concurrent.cu` | Stage 07 |
| `invariants.cu` | Stage 08 |
| `unit_tests.cu` | Stage 09 |
| `property_tests.cu` | Stage 10 |
| `benchmark.cu` | Stage 11 |
| `README.md` | Stage 12 |

## Verification & Execution Example

```text
nvcc -std=c++17 -O3 -arch=sm_80 core.cu validation.cu fast_path.cu concurrent.cu invariants.cu unit_tests.cu -o test_cu && ./test_cu
```

---
© 2026 Igor Kan
