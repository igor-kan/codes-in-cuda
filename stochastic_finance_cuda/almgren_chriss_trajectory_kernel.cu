#include "almgren_chriss_trajectory_kernel.cuh"

__global__ void almgren_inventory_kernel(float* inventory, float X_total, float kappa, float T, float dt, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    float t = idx * dt;
    inventory[idx] = X_total * sinhf(kappa * (T - t)) / sinhf(kappa * T);
}
