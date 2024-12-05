//
//  main.m
//  optimization
//
//  Created by jun on 12/5/24.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "quick_sort.h"
#include "quick_sort_with_for.h"
#include "matrix_multiply_index.h"
#include "matrix_multiply_pointer.h"
#include "matrix_multiply_index_optimized.h"

// 앞서 정의한 merge_sort와 quick_sort 함수 포함
#define N 100

int main(int argc, const char * argv[]) {
    double (*A)[N] = malloc(sizeof(double[N][N]));
    double (*B)[N] = malloc(sizeof(double[N][N]));
    double (*C)[N] = malloc(sizeof(double[N][N]));
    double (*C_opt)[N] = malloc(sizeof(double[N][N]));
    double (*C_ptr)[N] = malloc(sizeof(double[N][N]));

    // 행렬 초기화
    srand((unsigned int)time(NULL));
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            A[i][j] = rand() / (double)RAND_MAX;
            B[i][j] = rand() / (double)RAND_MAX;
        }
    }
    struct timespec start, end;
    
    double total_time;
    int iterations = 100;
    clock_gettime(CLOCK_MONOTONIC, &start);
    // 기본 행렬 곱셈 실행
    total_time = 0.0;
    for (int iter = 0; iter < iterations; iter++) {
        // C 초기화
        for (int i = 0; i < N; i++)
            for (int j = 0; j < N; j++)
                C[i][j] = 0.0;

        matrix_multiply_index(N, A, B, C);
        
//        total_time += (double)(end - start) / CLOCKS_PER_SEC;
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    double elapsed_time = (end.tv_sec - start.tv_sec) +
                             (end.tv_nsec - start.tv_nsec) / 1e9;
    
    printf("기본 행렬 곱셈 평균 실행 시간: %f초\n", elapsed_time);

    // 개선된 행렬 곱셈 실행
    clock_gettime(CLOCK_MONOTONIC, &start);
    total_time = 0.0;
    for (int iter = 0; iter < iterations; iter++) {
        // C_opt 초기화
        for (int i = 0; i < N; i++)
            for (int j = 0; j < N; j++)
                C_opt[i][j] = 0.0;

        
        matrix_multiply_index_optimized(N, A, B, C_opt);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    elapsed_time = (end.tv_sec - start.tv_sec) +
                             (end.tv_nsec - start.tv_nsec) / 1e9;
    printf("개선된 행렬 곱셈 평균 실행 시간: %f초\n", elapsed_time);

    // 포인터를 사용한 행렬 곱셈 실행
    total_time = 0.0;
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int iter = 0; iter < iterations; iter++) {
        // C_ptr 초기화
        for (int i = 0; i < N * N; i++)
            ((double *)C_ptr)[i] = 0.0;
        matrix_multiply_pointer(N, (double *)A, (double *)B, (double *)C_ptr);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    elapsed_time = (end.tv_sec - start.tv_sec) +
                             (end.tv_nsec - start.tv_nsec) / 1e9;
    printf("포인터를 사용한 행렬 곱셈 평균 실행 시간: %f초\n", elapsed_time);

    free(A);
    free(B);
    free(C);
    free(C_opt);
    free(C_ptr);

    return 0;
    return 0;
}
