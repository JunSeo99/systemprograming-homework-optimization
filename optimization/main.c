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
#include "linear_search.h"
#include "binary_search.h"
#include "hash_search.h"

// 앞서 정의한 merge_sort와 quick_sort 함수 포함
#define N 100
#define ARRAY_SIZE 10000

void efficiency_test_search();
void efficiency_test_matrix_multiply();

int compare_int(const void *a, const void *b) {
    int int_a = *(int *)a;
    int int_b = *(int *)b;
    return (int_a > int_b) - (int_a < int_b); // int_a - int_b 방식도 가능하지만 overflow 방지
}

int main(int argc, const char * argv[]) {
    efficiency_test_matrix_multiply();
    efficiency_test_search();
    
}

void efficiency_test_search() {
    int *arr = (int *)malloc(sizeof(int) * ARRAY_SIZE);
    HashTable *hash_table = create_hash_table(ARRAY_SIZE);

    // 배열 초기화
    srand((unsigned int)time(NULL));
    for (int i = 0; i < ARRAY_SIZE; i++) {
        arr[i] = rand() % 100000;
        insert_hash(hash_table, arr[i], i);  // 해시 테이블에 삽입
    }

    // 데이터 정렬 (이진 탐색용)
    qsort(arr, ARRAY_SIZE, sizeof(int), compare_int);

    int target = arr[rand() % ARRAY_SIZE]; 
    struct timespec start, end;

    // 순차 탐색
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int iter = 0; iter < N; iter++) {
        linear_search(arr, ARRAY_SIZE, target);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    double elapsed_time = (end.tv_sec - start.tv_sec) +
                             (end.tv_nsec - start.tv_nsec) / 1e9;
    
    printf("순차 탐색 평균 실행 시간: %f초\n",elapsed_time);

    // 이진 탐색
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int iter = 0; iter < N; iter++) {
        binary_search(arr, ARRAY_SIZE, target);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    
    elapsed_time = (end.tv_sec - start.tv_sec) +
                             (end.tv_nsec - start.tv_nsec) / 1e9;
    printf("이진 탐색 평균 실행 시간: %f초\n", elapsed_time);

    // 해시 기반 탐색
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int iter = 0; iter < N; iter++) {
        search_hash(hash_table, target);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    
    elapsed_time = (end.tv_sec - start.tv_sec) +
                             (end.tv_nsec - start.tv_nsec) / 1e9;
    
    printf("해시 탐색 평균 실행 시간: %f초\n", elapsed_time);

    free(arr);
    free(hash_table->table);
    free(hash_table);

}
void efficiency_test_matrix_multiply() {
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
    
    clock_gettime(CLOCK_MONOTONIC, &start);
    // 기본 행렬 곱셈 실행
    for (int iter = 0; iter < N; iter++) {
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
    for (int iter = 0; iter < N; iter++) {
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
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int iter = 0; iter < N; iter++) {
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

}
