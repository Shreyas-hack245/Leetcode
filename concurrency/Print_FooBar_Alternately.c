/* 1115. Print FooBar Alternately

Suppose you are given the following code:

class FooBar {
  public void foo() {
    for (int i = 0; i < n; i++) {
      print("foo");
    }
  }

  public void bar() {
    for (int i = 0; i < n; i++) {
      print("bar");
    }
  }
}
The same instance of FooBar will be passed to two different threads:

thread A will call foo(), while
thread B will call bar().
Modify the given program to output "foobar" n times.

 

Example 1:

Input: n = 1
Output: "foobar"
Explanation: There are two threads being fired asynchronously. One of them calls foo(), while the other calls bar().
"foobar" is being output 1 time.
Example 2:

Input: n = 2
Output: "foobarfoobar"
Explanation: "foobar" is being output 2 times.*/

//solution :

#include <pthread.h>
#include <stdlib.h>

typedef struct {
    int n;
    pthread_mutex_t mutex;
    pthread_cond_t cond;
    int turn; 

 void printFoo();
void printBar();

FooBar* fooBarCreate(int n) {
    FooBar* obj = (FooBar*) malloc(sizeof(FooBar));
    obj->n = n;
    pthread_mutex_init(&obj->mutex, NULL);
    pthread_cond_init(&obj->cond, NULL);
    obj->turn = 0; 
    return obj;
}

void foo(FooBar* obj) {
    for (int i = 0; i < obj->n; i++) {
        pthread_mutex_lock(&obj->mutex);
        
        while (obj->turn != 0) {
            pthread_cond_wait(&obj->cond, &obj->mutex);
        }
        
         printFoo();
        
        obj->turn = 1;
        pthread_cond_signal(&obj->cond);
        pthread_mutex_unlock(&obj->mutex);
    }
}

void bar(FooBar* obj) {
    for (int i = 0; i < obj->n; i++) {
        pthread_mutex_lock(&obj->mutex);
        
        while (obj->turn != 1) {
            pthread_cond_wait(&obj->cond, &obj->mutex);
        }
        
         printBar();
        
        obj->turn = 0;
        pthread_cond_signal(&obj->cond);
        pthread_mutex_unlock(&obj->mutex);
    }
}

void fooBarFree(FooBar* obj) {
    pthread_mutex_destroy(&obj->mutex);
    pthread_cond_destroy(&obj->cond);
    free(obj);
}
