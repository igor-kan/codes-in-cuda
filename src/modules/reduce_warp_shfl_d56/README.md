# Warp Shuffle-Down Tree Reduction Kernel (`reduce_warp_shfl_d56`)

> Category: **Parallel Reductions** | Language: **CUDA C++**

## Overview

Combines grid-stride vector sums with register-only __shfl_down_sync warp butterfly reductions before single-warp final emission.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / B + log W)` |
| **Space Complexity** | `O(W / 32) warp accumulators` |

## Mathematical & Safety Invariants

- Partial sums conserve exact block total across 256-thread blocks.

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
