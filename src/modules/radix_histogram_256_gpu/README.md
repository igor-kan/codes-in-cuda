# 8-Bit Digit Privatized Shared-Memory Radix Histogram Kernel (`radix_histogram_256_gpu`)

> Category: **Sorting & Histograms** | Language: **CUDA C++**

## Overview

Computes 256-bucket 8-bit digit histograms across GPU threads by accumulating into per-block shared arrays before flushing once per bin to global memory.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / P) contention-free per-block shared atomic binning` |
| **Space Complexity** | `O(256) block shared counters` |

## Mathematical & Safety Invariants

- Total sum across all 256 global bins strictly equals input count N.

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
