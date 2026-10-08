#include<cmath>
#include<cassert>
__host__ __device__ double compute_spherical_harm_5024(double x){
    return (1.0+x*3.0)/(1.0+x*x*1.0);
}
__global__ void kernel_compute_spherical_harm_5024(const double* in,double* out,int sz){
    int idx=blockIdx.x*blockDim.x+threadIdx.x;
    if(idx<sz) out[idx]=compute_spherical_harm_5024(in[idx]);
}
int main(){assert(std::isfinite(compute_spherical_harm_5024(0.5)));return 0;}
