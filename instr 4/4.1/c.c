#include <stdio.h>
#include <locale.h>

int szukaj4_max(int a, int b, int c, int d);

int main()
{
	setlocale(LC_ALL, "");  // Ustawienie lokalizacji na domyœln¹
	int x, y, z, a, wynik;
	printf("\nProszê podaæ cztery liczby ca³kowite ze znakiem: ");
	scanf_s("%d %d %d %d", &x, &y, &z, &a, 32);
	wynik = szukaj4_max(x, y, z, a);
	printf("\nSpoœród podanych liczb %d, %d, %d, %d, \
 liczba %d jest najwiêksza\n", x, y, z, a, wynik);
	return 0;
}