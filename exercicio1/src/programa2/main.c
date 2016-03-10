#include "calc_primo.h"
#include <stdio.h>

int main(int argc, char const *argv[])
{
	int i, n;
	int count;

	if(argc < 2)
		return 1;

	n = atoi(argv[1]);
	count = 0;

	for (i = 2; count < n; ++i)
	{
		if (primo(i)){
			printf("%d é primo.\n", i);
			count++;
		}
		else
			printf("%d não é primo.\n", i);
	}
}
