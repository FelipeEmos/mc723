#include <stdio.h>

int primo(int n)
{
  int i;

  for(i = 2; i < n; i ++)
    if (n % i == 0)
      return 0;
  
  return 1;
}

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
