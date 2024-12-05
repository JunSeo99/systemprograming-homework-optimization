//
//  linear_search.c
//  optimization
//
//  Created by jun on 12/6/24.
//

#include "linear_search.h"
int linear_search(int arr[], int size, int target) {
    for (int i = 0; i < size; i++) {
        if (arr[i] == target) {
            return i;
        }
    }
    return -1;
}
