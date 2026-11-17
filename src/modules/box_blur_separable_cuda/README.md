# Separable Horizontal + Vertical Shared-Memory 2D Box Filter (`box_blur_separable_cuda`)

> Category: **Image Processing (GPU)** | Language: **CUDA C++**

## Overview

Splits quadratic 2D box filtering into coalesced horizontal row smoothing followed by strided vertical column smoothing across device scratch.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(W * H) 2-pass O(R) separable tile` |
| **Space Complexity** | `O(TILE + 2*R) shared row/col` |

## Mathematical & Safety Invariants

- Separable two-pass result agrees with naive (2R+1)^2 box average.

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
