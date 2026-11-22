# Fused Multiply-Add Warp-Shuffle Dot Product (`dot_prod_warp_shfl_d57`)

> Category: **Linear Reductions** | Language: **CUDA C++**

## Overview

Accumulates thread-local elementwise squares via grid-stride FMA loops and folds partial products with register-only __shfl_down_sync.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / B + log 32)` |
| **Space Complexity** | `O(8) warp partials` |

## Mathematical & Safety Invariants

- Outputs scalar L2 norm squared across block warps cleanly.

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
