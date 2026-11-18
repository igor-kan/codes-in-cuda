# Clenshaw Recurrence Parallel Chebyshev Series Evaluator (`chebyshev_poly_eval_cuda`)

> Category: **Special Functions & Approximation** | Language: **CUDA C++**

## Overview

Evaluates degree-K Chebyshev expansions sum_{k=0}^K c_k T_k(x) over [-1, 1] for N points in parallel using Clenshaw's numerically stable backward recurrence.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N * K / P) backward three-term Clenshaw recurrence` |
| **Space Complexity** | `O(1) registers per thread` |

## Mathematical & Safety Invariants

- Matches explicit cosine series sum c_k cos(k * acos(x)) to FP32 precision.

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
