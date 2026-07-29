// 1117. Building H2O

//There are two kinds of threads: oxygen and hydrogen. Your goal is to group these threads to form water molecules.

//There is a barrier where each thread has to wait until a complete molecule can be formed. Hydrogen and oxygen threads will be given releaseHydrogen and releaseOxygen methods respectively, which will allow them to pass the barrier. These threads should pass the barrier in groups of three, and they must immediately bond with each other to form a water molecule. You must guarantee that all the threads from one molecule bond before any other threads from the next molecule do.

//In other words:

//If an oxygen thread arrives at the barrier when no hydrogen threads are present, it must wait for two hydrogen threads.
//If a hydrogen thread arrives at the barrier when no other threads are present, it must wait for an oxygen thread and another hydrogen thread.
//We do not have to worry about matching the threads up explicitly; the threads do not necessarily know which other threads they are paired up with. The key is that threads pass the barriers in complete sets; thus, if we examine the sequence of threads that bind and divide them into groups of three, each group should contain one oxygen and two hydrogen threads.

//Write synchronization code for oxygen and hydrogen molecules that enforces these constraints.

 

//Example 1:

//Input: water = "HOH"
//Output: "HHO"
//Explanation: "HOH" and "OHH" are also valid answers.
//Example 2:

//Input: water = "OOHHHH"
//Output: "HHOHHO"
//Explanation: "HOHHHO", "OHHHHO", "HHOHOH", "HOHHOH", "OHHHOH", "HHOOHH", "HOHOHH" and "OHHOHH" are also valid answers.

//solution:

#include <pthread.h>
#include <semaphore.h>
#include <stdlib.h>

typedef struct {
    sem_t hydrogen_sem;
    sem_t oxygen_sem;
    pthread_mutex_t mutex;
    int hydrogen_count;
    int oxygen_count;
} H2O;

void releaseHydrogen();
void releaseOxygen();

H2O* h2oCreate() {
    H2O* obj = (H2O*) malloc(sizeof(H2O));
    
     sem_init(&obj->hydrogen_sem, 0, 2); 
    sem_init(&obj->oxygen_sem, 0, 1);   
    
     pthread_mutex_init(&obj->mutex, NULL);
    obj->hydrogen_count = 0;
    obj->oxygen_count = 0;
    
    return obj;
}

void hydrogen(H2O* obj) {
    sem_wait(&obj->hydrogen_sem);
    
    pthread_mutex_lock(&obj->mutex);
    obj->hydrogen_count++;
    
     releaseHydrogen();
    
     if (obj->hydrogen_count == 2 && obj->oxygen_count == 1) {
        obj->hydrogen_count = 0;
        obj->oxygen_count = 0;
        sem_post(&obj->hydrogen_sem);
        sem_post(&obj->hydrogen_sem);
        sem_post(&obj->oxygen_sem);
    }
    pthread_mutex_unlock(&obj->mutex);
}

void oxygen(H2O* obj) {
    sem_wait(&obj->oxygen_sem);
    
    pthread_mutex_lock(&obj->mutex);
    obj->oxygen_count++;
    
     releaseOxygen();
    
     if (obj->hydrogen_count == 2 && obj->oxygen_count == 1) {
        obj->hydrogen_count = 0;
        obj->oxygen_count = 0;
        sem_post(&obj->hydrogen_sem);
        sem_post(&obj->hydrogen_sem);
        sem_post(&obj->oxygen_sem);
    }
    pthread_mutex_unlock(&obj->mutex);
}

void h2oFree(H2O* obj) {
     sem_destroy(&obj->hydrogen_sem);
    sem_destroy(&obj->oxygen_sem);
    pthread_mutex_destroy(&obj->mutex);
    free(obj);
}
