//
//  hash_search.c
//  optimization
//
//  Created by jun on 12/6/24.
//

#include "hash_search.h"
#include <stdlib.h>
#include <string.h>

unsigned int hash_function(int key, int size) {
    return (unsigned int)(key % size);
}

HashTable *create_hash_table(int size) {
    HashTable *hash_table = (HashTable *)malloc(sizeof(HashTable));
    hash_table->table = (HashNode *)calloc(size, sizeof(HashNode));
    hash_table->size = size;
    return hash_table;
}

void insert_hash(HashTable *hash_table, int key, int value) {
    int index = hash_function(key, hash_table->size);
    while (hash_table->table[index].key != 0) {
        index = (index + 1) % hash_table->size;
    }
    hash_table->table[index].key = key;
    hash_table->table[index].value = value;
}

int search_hash(HashTable *hash_table, int key) {
    int index = hash_function(key, hash_table->size);
    while (hash_table->table[index].key != 0) {
        if (hash_table->table[index].key == key) {
            return hash_table->table[index].value;
        }
        index = (index + 1) % hash_table->size;
    }
    return -1;
}
