//
//  matrix_multiply_pointer.c
//  system-call
//
//  Created by jun on 12/5/24.
//

#include "matrix_multiply_pointer.h"

void matrix_multiply_pointer(int N, double *A, double *B, double *C) {
    for (int i = 0; i < N; i++) {
        double *c_row = C + i * N;
        for (int k = 0; k < N; k++) {
            double *b_row = B + k * N;
            double a_val = *(A + i * N + k);
            for (int j = 0; j < N; j++) {
                c_row[j] += a_val * b_row[j];
            }
        }
    }
}

