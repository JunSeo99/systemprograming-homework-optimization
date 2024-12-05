//
//  hash_search.h
//  optimization
//
//  Created by jun on 12/6/24.
//

#ifndef hash_search_h
#define hash_search_h

#include <stdio.h>

typedef struct {
    int key;
    int value;
} HashNode;

typedef struct {
    HashNode *table;
    int size;
} HashTable;


unsigned int hash_function(int key, int size);
HashTable *create_hash_table(int size);
void insert_hash(HashTable *hash_table, int key, int value);
int search_hash(HashTable *hash_table, int key);
#endif /* hash_search_h */
