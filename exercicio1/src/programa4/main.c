#include "calc_primo.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
	int i, n;
	int count;

	if(argc < 2)
		return 1;

	n = atoi(argv[1]);
	count = 0;
	
	if( n >= 2)
		count++;
	
	#pragma omp parallel for   \
	default(shared) private(i) \
    reduction(+:count) 
	for (i = 3; i < n; i+=2)
	{
		if (primo(i)){
			count++;
		}
	}
	
	printf("%d\n", count);
}
