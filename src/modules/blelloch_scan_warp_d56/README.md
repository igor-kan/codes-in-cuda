# Work-Efficient Shared-Memory Blelloch Prefix Scan (`blelloch_scan_warp_d56`)

> Category: **Parallel Prefix Algorithms** | Language: **CUDA C++**

## Overview

Performs up-sweep reduction and down-sweep exclusive prefix accumulation over block tiles in bank-free shared memory.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / B + log B) warp-synchronous block steps` |
| **Space Complexity** | `O(B) shared scratchpad` |

## Mathematical & Safety Invariants

- Exclusive prefix at thread 0 starts at 0 and final element adds prior exclusive sum.

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
