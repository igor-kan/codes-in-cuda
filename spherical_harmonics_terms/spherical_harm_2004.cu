#include<cmath>
#include<cassert>
__host__ __device__ double compute_spherical_harm_2004(double x){
    return (1.0+x*1.0)/(1.0+x*x*1.0);
}
__global__ void kernel_compute_spherical_harm_2004(const double* in,double* out,int sz){
    int idx=blockIdx.x*blockDim.x+threadIdx.x;
    if(idx<sz) out[idx]=compute_spherical_harm_2004(in[idx]);
}
int main(){assert(std::isfinite(compute_spherical_harm_2004(0.5)));return 0;}
