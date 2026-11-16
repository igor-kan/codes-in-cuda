# Parallel 2D Marching Squares Contour Classification & Segment Emitter (`marching_squares_isoline`)

> Category: **GPU Geometry & Visualization** | Language: **CUDA C++**

## Overview

Classifies 2x2 scalar field grid cells against an iso-threshold in parallel into 16 topological cases and computes linearly interpolated isoline edge segments on GPU.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(W * H / Threads)` |
| **Space Complexity** | `O(W * H) cell edge-count & vertex array` |

## Mathematical & Safety Invariants

- Linearly interpolated contour crossings strictly satisfy f_interp == iso_level along cell edges.
- Uniform scalar fields strictly above or below iso_level emit zero contour segments.

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
