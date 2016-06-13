#include <stdio.h>
#define PERIPH_ADDR (100*1024*1024)

int main(){
  volatile int* addr = (int*) PERIPH_ADDR;
  printf("Default value = %d\n", *addr);
  printf("Next value = %d\n", *addr);
  printf("Next value = %d\n", *addr);
  printf("Next value = %d\n", *addr);
  *addr = 0;
  printf("Modified via code to 0\n");
  printf("New value = %d\n", *addr);
  printf("New value = %d\n", *addr);
  return 0;
}
