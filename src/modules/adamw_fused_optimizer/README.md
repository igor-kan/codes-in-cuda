# Fused Grid-Stride AdamW Parameter, Moment & Decoupled Decay Kernel (`adamw_fused_optimizer`)

> Category: **GPU Deep Learning Optimizers** | Language: **CUDA C++**

## Overview

Fuses decoupled weight decay, biased first/second moment updates, bias correction factors, and parameter descent into a single CUDA kernel launch to minimize global memory bandwidth traffic.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(NumParams / Threads) single global-memory pass` |
| **Space Complexity** | `O(NumParams) in-place p, m, v tensors` |

## Mathematical & Safety Invariants

- Under zero gradients, weights decay geometrically as p *= (1 - lr * weight_decay)^steps.
- Second moment buffer v remains strictly non-negative everywhere.

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
