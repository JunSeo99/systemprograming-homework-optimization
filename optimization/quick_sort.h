//
//  quick_sort.h
//  system-call
//
//  Created by jun on 12/5/24.
//

#ifndef quick_sort_h
#define quick_sort_h

#include <stdio.h>
void swap(int *a, int *b);
int partition(int arr[], int low, int high);
void quick_sort(int arr[], int low, int high);
#endif /* quick_sort_h */
