// Matin Araghi - 97573150
// Matrix Addition

#include <stdio.h>
#include <stdlib.h>

#define N 3

__global__ void MatAdd(int A[][N], int B[][N], int C[][N]){
           int i = threadIdx.x;
           int j = threadIdx.y;

           C[i][j] = A[i][j] + B[i][j];
       }


int main(){

    int A[N][N] = {{1,2,3},{4,5,6}};
    int B[N][N] = {{7,8,9},{10,11,12}};
    int C[N][N] = {{0,0,0},{0,0,0}};    

    int (*pA)[N], (*pB)[N], (*pC)[N];

    cudaMalloc((void**)&pA, (N*N)*sizeof(int));
    cudaMalloc((void**)&pB, (N*N)*sizeof(int));
    cudaMalloc((void**)&pC, (N*N)*sizeof(int));

    cudaMemcpy(pA, A, (N*N)*sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(pB, B, (N*N)*sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(pC, C, (N*N)*sizeof(int), cudaMemcpyHostToDevice);

    int numBlocks = 1;
    dim3 threadsPerBlock(N,N);
    MatAdd<<<numBlocks,threadsPerBlock>>>(pA,pB,pC);

    cudaMemcpy(C, pC, (N*N)*sizeof(int), cudaMemcpyDeviceToHost);

    int i, j; printf("C = \n");
    for(i=0;i<2;i++){
        for(j=0;j<N;j++){
            printf("%d ", C[i][j]);
        }
        printf("\n");
    }

    cudaFree(pA); 
    cudaFree(pB); 
    cudaFree(pC);

    printf("\n");

    return 0;
}