# 2D Clamped Sobel Gradient Magnitude Edge Filter (`sobel_edge_2d_d59`)

> Category: **Computer Vision Kernels** | Language: **CUDA C++**

## Overview

Evaluates horizontal and vertical 3x3 Sobel convolution differences cleanly with border coordinate clamping and hypot gradient magnitude.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(W * H)` |
| **Space Complexity** | `O(1) register stencil` |

## Mathematical & Safety Invariants

- Flat uniform intensity frames emit zero edge response across every pixel.

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
