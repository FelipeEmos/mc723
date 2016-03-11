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

	for (i = 2; i < n; ++i)
	{
		if (primo(i)){
			count++;
		}
	}
	
	printf("%d\n", count);
}
