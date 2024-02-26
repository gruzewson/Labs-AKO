#include <stdio.h>
void przestaw(int tab[], int size);
int main()
{
    int tab[] = { -5,2,145,4,44,0 };
    int size = sizeof(tab) / sizeof(tab[0]);
    for (int i = 0; i < size - 1; i++)
    {
        przestaw(tab, size - i);
    }

    for (int i = 0; i < size; i++)
    {
        printf_s("%d ", tab[i]);
    }
}