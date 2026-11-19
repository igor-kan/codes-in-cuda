# Shared-Cached Vector Dense Matrix-Vector Multiply Kernel (`dense_gemv_shared_x_gpu`)

> Category: **Dense Linear Algebra** | Language: **CUDA C++**

## Overview

Tiles input vector x into block shared memory chunks of 256 floats so each row thread accumulates dot products without redundant global vector fetches.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(M * K / P) tiled shared vector x reuse across rows` |
| **Space Complexity** | `O(256) shared vector tile` |

## Mathematical & Safety Invariants

- Dot product output y[row] matches exact FP64 reference inner product.

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
