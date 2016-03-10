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

	printf("%d é primo.\n", 2);
	count++;

	for (i = 3; count < n; i+=2)
	{
		if (primo(i)){
			printf("%d é primo.\n", i);
			count++;
		}
		else
			printf("%d não é primo.\n", i);
	}
}
