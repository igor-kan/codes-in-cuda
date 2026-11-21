# Bank-Conflict-Free Shared Tile Matrix Transpose (`transpose_tiled_smem_d56`)

> Category: **Memory Coalescing** | Language: **CUDA C++**

## Overview

Transposes square float blocks in 16x16 tiles using +1 stride shared memory padding to guarantee bank-conflict-free column reads.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^2) coalesced global reads/writes` |
| **Space Complexity** | `O(32 * 33) padded shared tile` |

## Mathematical & Safety Invariants

- Transpose applied twice recovers identical global layout.

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
