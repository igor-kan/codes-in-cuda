# Grid-Stride IEEE-754 Fused Multiply-Add Affine Vector Kernel (`saxpy_fma_fused_d60`)

> Category: **GPU BLAS Primitives** | Language: **CUDA C++**

## Overview

Computes single-precision y[i] = fmaf(alpha, x[i], beta) using grid-stride hardware FMA instructions avoiding double rounding error.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / (G * B)) coalesced grid-stride fmaf pass` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Every output element equals single-rounding fused alpha*x + beta.

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
