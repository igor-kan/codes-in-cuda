# Vectorized Leaky-ReLU & Clamped Sigmoid Activation (`relu_softmax_act_d58`)

> Category: **Neural Kernels** | Language: **CUDA C++**

## Overview

Applies fused Leaky-ReLU activation across 1D global tensor buffers in grid-stride coalesced fashion.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / G) memory bandwidth bound` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Positive entries pass strictly unscaled while negative entries contract by slope.

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
