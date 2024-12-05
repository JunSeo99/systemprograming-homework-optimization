//
//  matrix_multiply_index.c
//  system-call
//
//  Created by jun on 12/5/24.
//

#include "matrix_multiply_index.h"
void matrix_multiply_index(int N, double A[N][N], double B[N][N], double C[N][N]) {
    for (int i = 0; i < N; i++) {          // 행
        for (int j = 0; j < N; j++) {      // 열
            C[i][j] = 0.0;
            for (int k = 0; k < N; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}
