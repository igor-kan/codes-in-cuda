# Shared-Memory Privatized 32-Bin Quantized Histogram Kernel (`histogram_priv_sh_d60`)

> Category: **GPU Reductions & Atomics** | Language: **CUDA C++**

## Overview

Reduces global memory atomic contention by accumulating quantized [0, 32) float bin counts in CTA shared memory before flushing to global counters.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / B) per-block shared atomic accumulation + single global flush` |
| **Space Complexity** | `O(32) shared bins per CTA` |

## Mathematical & Safety Invariants

- Total across 32 output histogram bins equals processed sample count.

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
