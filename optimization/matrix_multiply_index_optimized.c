//
//  matrix_multiply_index_optimized.c
//  system-call
//
//  Created by jun on 12/5/24.
//

#include "matrix_multiply_index_optimized.h"

void matrix_multiply_index_optimized(int N, double A[N][N], double B[N][N], double C[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int k = 0; k < N; k++) {
            double temp = A[i][k];
            for (int j = 0; j < N; j++) {
                C[i][j] += temp * B[k][j];
            }
        }
    }
}
