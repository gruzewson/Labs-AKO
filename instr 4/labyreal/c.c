//MARCEL GRU¯EWSKI 193589
#include <stdio.h>

int szukaj_abs_max(int tab[], int n);

int main()
{
    int tab[] = { -1,-2, 2, 4,-44,0 };
    int size = sizeof(tab) / sizeof(tab[0]);
    int wynik = szukaj_abs_max(tab, size);


    printf_s("najwieksza wartosc abs z tej tablicy to: %d ", wynik);
}