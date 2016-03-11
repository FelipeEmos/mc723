#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#define TRUE 1
#define FALSE 0
#define bool int

bool isPrimeSimple(long n)
{
  long i;

  for(i = 2; i*i <= n; i ++)
    if (n % i == 0)
      return FALSE;
  
  return TRUE;
}

int main(int argc, char const *argv[])
{	
	long i; 
	long n;
	long count = 0;

	if(argc < 2){
		printf("Need more arguments\n");
		return 1;
	}

	n = atol(argv[1]);
	
	//#pragma omp parallel for   \
	//schedule(static,1) \
	//default(shared) private(i)
	for (i = 2; count < n; i++)
	{
		if (isPrimeSimple(i)){
			count++;
		}
	}
	
	printf("%ld\n", i-1);
}
