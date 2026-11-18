# Batched 2x2 Givens Orthogonal Rotation QR Kernel (`batched_givens_qr_2x2_gpu`)

> Category: **Batched Linear Algebra** | Language: **CUDA C++**

## Overview

Computes stable Givens rotations [c, s; -s, c] across thousands of independent 2x2 matrices in parallel to zero subdiagonal entries while preserving column norms.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(B / P) branch-free hypot Givens cosine/sine elimination` |
| **Space Complexity** | `O(1) per thread` |

## Mathematical & Safety Invariants

- Rotated subdiagonal entry R[1,0] vanishes and c^2 + s^2 == 1.

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
