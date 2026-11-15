# Safe Single-Pass Online Softmax Kernel via Warp-Shuffle Rescaling (`softmax_online_safe`)

> Category: **GPU Numerical Kernels** | Language: **CUDA C++**

## Overview

Computes numerically stable row-wise Softmax without separate max and sum passes by combining (max, normalizer) state pairs associatively through __shfl_down_sync.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(Rows * Cols / Threads) reducing global memory reads by 33%` |
| **Space Complexity** | `O(32) warp reduction pairs in shared memory` |

## Mathematical & Safety Invariants

- Every output row lies strictly in [0, 1] and sums to 1.0 +/- 1e-5.
- Invariance under uniform row shifts: softmax(x + c) == softmax(x).

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
