#include <stdio.h>
#include <stdlib.h>
#define LOCK_ADDR (100*1024*1024)
volatile int *lock = (volatile int *) LOCK_ADDR;
volatile int procCounter = 0;

#define VECTOR_SIZE 1000000
volatile int *vetor;
volatile int media = 0;

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

int somavetor(int first, int end){
   int sum = 0;
   for(int i = first; i< end; i++){
       sum += vetor[i];
   }
   return sum;
}

int main2(){
  int procNumber;
  int sum;

  aquireLock();
  procNumber = procCounter++;
  if(procNumber == 0){
    vetor = (int*) malloc (VECTOR_SIZE * sizeof(int));
    for(int i = 0; i < VECTOR_SIZE; i++){
       // Inicializa o vetor
       vetor[i] = i*2;
    }
    printf("Vetor de tamanho [%d] inicializado: { ", VECTOR_SIZE);
    for(int i = 0; i< 4; i++){
       printf("%d, ", vetor[i]);
    }
    printf("..., %d, %d }\n", vetor[VECTOR_SIZE-2], vetor[VECTOR_SIZE-1]);
  } else{
    releaseLock();
    return 0;
  }
  releaseLock();

  if(procNumber%2==0){
	sum = somavetor(0,VECTOR_SIZE);
  } else {
        sum = somavetor(0, 0);
  }
  
  aquireLock();
  procNumber = procCounter++;
  media += sum;
  printf("Processor number %d summed from index %d to %d and got: %d\n", procNumber-2,
 (procNumber == 2? 0: 0), (procNumber == 2? VECTOR_SIZE: 0), sum);
  if(procNumber == 3) {
     printf("Soma vale: %d\n", media);
     media = media / VECTOR_SIZE;
     printf("Media vale: %d\n", media);
  }
  releaseLock();
  //exit(0);
  return 0;
}

int main(){
 return main2();
}
