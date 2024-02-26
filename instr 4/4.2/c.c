#include <stdio.h>
void plus_jeden(int* a);
int main()
{
	int m;
	m = 32;
	plus_jeden(&m);
	printf("\n m = %d\n", m);
	return 0;
}