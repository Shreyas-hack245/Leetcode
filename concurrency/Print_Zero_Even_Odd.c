// 1116. Print Zero Even Odd
//
// You are given a function `printNumber(int x)` that prints the integer `x`.
//
// Three different threads share the same instance of the `ZeroEvenOdd` class:
//
// Thread A:
// - Calls zero()
// - Should print only 0's.
//
// Thread B:
// - Calls even()
// - Should print only even numbers.
//
// Thread C:
// - Calls odd()
// - Should print only odd numbers.
//
// The three threads execute asynchronously, so you must synchronize them
// to produce the correct output sequence.
//
// Required Output Pattern:
// 010203040506...
//
// The total length of the output string should be 2 * n.
//
// Implement the ZeroEvenOdd class:
//
// - ZeroEvenOdd(int n)
//     Initializes the object with the given value n.
//
// - void zero(printNumber)
//     Prints one 0 before every number.
//
// - void even(printNumber)
//     Prints only even numbers (2, 4, 6, ...).
//
// - void odd(printNumber)
//     Prints only odd numbers (1, 3, 5, ...).
//
// Example 1:
// Input:  n = 2
// Output: "0102"
//
// Explanation:
// Three threads run concurrently.
// The zero thread prints 0 before each number.
// The odd thread prints 1.
// The even thread prints 2.
// Final sequence: 0 1 0 2
//
// Example 2:
// Input:  n = 5
// Output: "0102030405"
//
// Explanation:
// The required order is:
// 0 1 0 2 0 3 0 4 0 5


//solution:

#include <semaphore.h>
#include <stdlib.h>

 void printNumber(int x);

typedef struct {
    int n;
    sem_t zero_sem;
    sem_t even_sem;
    sem_t odd_sem;
} ZeroEvenOdd;

ZeroEvenOdd* zeroEvenOddCreate(int n) {
    ZeroEvenOdd* obj = (ZeroEvenOdd*) malloc(sizeof(ZeroEvenOdd));
    obj->n = n;
    
     sem_init(&(obj->zero_sem), 0, 1); 
    sem_init(&(obj->even_sem), 0, 0);  
    sem_init(&(obj->odd_sem), 0, 0);   
    
    return obj;
}

void zero(ZeroEvenOdd* obj) {
    for (int i = 1; i <= obj->n; i++) {
        sem_wait(&(obj->zero_sem));
        printNumber(0);
        
         if (i % 2 != 0) {
            sem_post(&(obj->odd_sem));
        } else {
            sem_post(&(obj->even_sem));
        }
    }
}

void even(ZeroEvenOdd* obj) {
    for (int i = 2; i <= obj->n; i += 2) {
        sem_wait(&(obj->even_sem));
        printNumber(i);
        sem_post(&(obj->zero_sem));
    }
}

void odd(ZeroEvenOdd* obj) {
    for (int i = 1; i <= obj->n; i += 2) {
        sem_wait(&(obj->odd_sem));
        printNumber(i);
        sem_post(&(obj->zero_sem));
    }
}

void zeroEvenOddFree(ZeroEvenOdd* obj) {
    sem_destroy(&(obj->zero_sem));
    sem_destroy(&(obj->even_sem));
    sem_destroy(&(obj->odd_sem));
    free(obj);
}
