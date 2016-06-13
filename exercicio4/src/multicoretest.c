#include <stdio.h>
#define LOCK_ADDR (100*1024*1024)
volatile int *lock = (volatile int *) LOCK_ADDR;
volatile int procCounter = 0;

void aquireLock(){
  while(*lock);
}

void releaseLock(){
  *lock = 0;
}

void recursiveHello(int n, int procNumber){
  if(n) {
    printf("Hi from processor no [%d]\n", procNumber);
    recursiveHello(n-1, procNumber);
  }
}

int main(){
  return main2();
}

int main2(){
  int procNumber;  

  aquireLock();
  procNumber = procCounter++;
  releaseLock();

  if(procNumber%2){
	for(int i = 0; i< 100000; i++);
  }
  recursiveHello(10, procNumber);
  //exit(0);
  return 0;
}
