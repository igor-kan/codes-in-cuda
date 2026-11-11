# Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline (`warp_matrix_tensor_bf16`)

## Architectural Specification

The `warp_matrix_tensor_bf16` module provides advanced computational algorithms for `codes-in-cuda`.

### Component Artifacts

- **Types & Configuration**: [`types.md`](./types.md)
- **Abstract Interface**: [`interface.md`](./interface.md)
- **Core Computational Kernel**: [`core.md`](./core.md)
- **Unit Verification**: [`test_unit.md`](./test_unit.md)
- **Boundary Guards**: [`boundary.md`](./boundary.md)
- **SIMD Accelerations**: [`perf_simd.md`](./perf_simd.md)
- **Cache Locality Tiling**: [`cache_locality.md`](./cache_locality.md)
- **Concurrency & Reentrancy**: [`concurrency.md`](./concurrency.md)
- **Microbenchmarking**: [`benchmarks.md`](./benchmarks.md)
- **Continuous Fuzzing Target**: [`fuzz_target.md`](./fuzz_target.md)
- **Crash Regression Suite**: [`regression.md`](./regression.md)
- **Formal Invariants**: [`invariants.md`](./invariants.md)
- **Diagnostic Errors**: [`errors.md`](./errors.md)

### Operational Complexity

| Routine | Time Complexity | Auxiliary Space |
| :--- | :--- | :--- |
| **Compute** | $\mathcal{O}(N)$ | $\mathcal{O}(1)$ |
| **Tiled Memory Step** | $\mathcal{O}(N \log N)$ | $\mathcal{O}(1)$ |

---
*Maintained under continuous integration and sanitizer testing.*
