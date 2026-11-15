# 2D Shared-Memory Halo-Tiled Sobel Gradient Magnitude Kernel (`sobel_edge_shared`)

> Category: **GPU Image Processing** | Language: **CUDA C++**

## Overview

Loads a 16x16 interior image tile plus 1-pixel apron border into __shared__ memory with clamp-to-edge boundaries to compute horizontal and vertical Sobel gradients without redundant global fetches.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(W * H / Threads) with coalesced halo reuse in __shared__ SRAM` |
| **Space Complexity** | `O((BW + 2) * (BH + 2)) shared tile bytes per block` |

## Mathematical & Safety Invariants

- Constant uniform intensity images produce identically zero gradient magnitude everywhere.
- Output dimensions match input image dimensions with clamped boundary extension.

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
