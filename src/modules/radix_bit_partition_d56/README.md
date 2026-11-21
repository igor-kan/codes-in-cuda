# Warp-Ballot Binary Radix Partition Step (`radix_bit_partition_d56`)

> Category: **GPU Sorting Primitives** | Language: **CUDA C++**

## Overview

Counts zero/one predicate bits across active CUDA warps via __ballot_sync and assigns deterministic partitioned output offsets.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / W) per bit pass` |
| **Space Complexity** | `O(1) registers` |

## Mathematical & Safety Invariants

- Total emitted count of zeros plus ones equals exact active block elements.

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
